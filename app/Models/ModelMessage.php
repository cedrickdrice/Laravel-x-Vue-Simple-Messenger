<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class ModelMessage extends Model
{
    use HasFactory;

    protected $table = 'messages';

    protected $fillable = [
        'room_id',
        'sender_id',
        'receiver_id',
        'message',
        'status',
        'image'
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = ['message_sent_time'];

    /**
     * Get the blogging site's name.
     *
     * @return string
     */
    public function getMessageSentTimeAttribute()
    {
        return Carbon::createFromTimeStamp(strtotime($this->created_at))->diffForHumans();
    }

    public function room()
    {
        return $this->belongsTo(ModelMessageRoom::class, 'room_id');
    }

    public function sender()
    {
        return $this->belongsTo(ModelUser::class, 'sender_id');
    }

    public function receiver()
    {
        return $this->belongsTo(ModelUser::class, 'receiver_id');
    }

    public static function addData($room_id,$sender_id,$receiver_id,$request){
        // Save copy for the receiver

        $data = new self;
        $data->room_id      = $room_id;
        $data->sender_id = $sender_id;
        $data->receiver_id   = $receiver_id;
        $data->message      = $request->message;
        $data->status       = 0;
        $data->save();
        return $data;
    }
}
