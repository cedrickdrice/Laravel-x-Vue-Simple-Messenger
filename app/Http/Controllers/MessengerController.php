<?php

namespace App\Http\Controllers;

use App\Events\MyEvent;
use App\Events\MessageCreated;
use App\Models\MessageRoom as Room;
use App\Models\ModelMessage;
use App\Models\ModelMessageRoom;
use App\Models\ModelMessageUser;
use App\Models\User;
use Illuminate\Http\Request;
use Auth;

class MessengerController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * [Type] View
     * @return view
     */
    public function viewMessenger()
    {
        return view('welcome');
    }

    /**
     * [Type] API
     * [Method] GET Request
     * @param Request $oRequest
     * @return Request
     */
    public function getUserDetail()
    {
        $aCurrentUser = auth()->user();
        return response()->json([
            'result' => 'success',
            'user' => $aCurrentUser
        ]);
    }

    /**
     * Get user list of your previous chat
     * [Type] API
     * [Method] GET Request
     * @param Request $oRequest
     * @return Request
     */
    public function getContactList()
    {
        /**
         * Select All messages
         * Unique by room, relationship
         */
        $aRecentMessages = ModelMessage::where('sender_id','=', Auth::user()->id)
            ->OrWhere('receiver_id', '=', Auth::user()->id)
            ->with('room', 'sender', 'receiver')
            ->latest()
            ->get()
            ->unique('room');

        return response()->json([
            'result' => 'success',
            'list' => $aRecentMessages,
        ]);
    }

    public function searchUserList(Request $oRequest)
    {
        $sSearch = $oRequest->search;
        $aUserList = User::where('id','!=', Auth::user()->id)
            ->where(function($oQuery) use($sSearch) {
                $oQuery->where('name','like','%'.$sSearch.'%')
                    ->orWhere('email','like','%'.$sSearch.'%');
            })
            ->get();
        return response()->json([
            'result' => 'success',
            'list' => $aUserList,
        ]);
    }

    /**
     * Select a Chat on Sidebar and show to chat
     * [Type] API
     * [Method] POST Request
     * @param Request $oRequest
     * @return \Illuminate\Http\JsonResponse
     */
    public function getSelectChat(Request $oRequest)
    {
        $iFriendId = $oRequest->user_id;
        $aChatMessage = $this->getChatMessageRoom(Auth::user()->id, $iFriendId);
        if (is_null($aChatMessage) === true) {
            $aChatMessage = ModelMessageRoom::create([
               'creator_id' => Auth::user()->id
            ])->participant()->create([
                'user_id' => Auth::user()->id,
                'recipient_id' => $iFriendId
            ]);
            $aChatMessage = $this->getChatMessageRoom(Auth::user()->id, $iFriendId);
        }

        return response()->json([
            'result' => 'success',
            'messages' => $aChatMessage,
        ]);
    }

    /**
     * [Type] API
     * [Method] POST Request
     * @param Request $oRequest
     * @return Request
     */
    public function sendMessage(Request $oRequest)
    {
        $iFriendId = $oRequest->message_to;
        $data['messages'] = $this->getChatMessageRoom(Auth::user()->id, $iFriendId);

        $aMessageCreate = [
            'room_id'       => $data['messages']->id,
            'sender_id'     => Auth::user()->id,
            'receiver_id'   => $oRequest->message_to,
            'message'       => $oRequest->message,
            'status'        => 0,
        ];

        if($oRequest->hasFile('file') === true) {
            $file = $oRequest->file('file') ;
            $sGeneratedFileName = time()."__".$file->getClientOriginalName();
            $destinationPath = public_path() . '/images' ;
            $file->move($destinationPath, $sGeneratedFileName);
            $aMessageCreate['image'] = '/images/' . $sGeneratedFileName;
        }

        ModelMessage::create($aMessageCreate);
        $aUpdatedMessages = $this->getChatMessageRoom(Auth::user()->id, $iFriendId);

        event(new MyEvent($aUpdatedMessages->message->last()));

        return response()->json([
            'result' => 'success',
            'message' => $aUpdatedMessages
        ]);
    }

    /**
     * Get Chat Room with messages and users detail
     * @param $iLoggedUserId
     * @param $iFriendId
     * @return mixed
     */
    private function getChatMessageRoom($iLoggedUserId, $iFriendId)
    {
        return ModelMessageRoom::whereHas('participant', function ($query) use ($iLoggedUserId, $iFriendId){
                $query->where(function ($query) use ($iLoggedUserId, $iFriendId){
                    $query->where('user_id','=', $iLoggedUserId)
                        ->where('recipient_id', '=', $iFriendId);
                })
                    ->OrWhere(function ($query) use ($iLoggedUserId, $iFriendId){
                        $query->where('user_id','=', $iFriendId)
                            ->where('recipient_id', '=', $iLoggedUserId);
                    });
            })->with('participant', 'message')->latest()->first();
    }
}
