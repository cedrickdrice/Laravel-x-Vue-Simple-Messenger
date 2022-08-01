<?php

namespace App\Events;

use App\Models\ModelMessage;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class MessageCreated implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $message;

    /**
     * Create a new event instance.
     *
     * @param ModelMessage $oMessage
     */
    public function __construct(ModelMessage $oMessage)
    {
        $this->message = $oMessage;
    }

    public function broadcastAs()
    {
        return 'MessageCreated';
    }

    public function broadcastWith()
    {
//        $this->message->load(['sender']);
//        $this->message->load(['receiver']);
        return [
            'message' => $this->message->toArray()
        ];
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('chat');
    }
}
