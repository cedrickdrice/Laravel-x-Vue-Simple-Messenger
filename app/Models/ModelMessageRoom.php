<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelMessageRoom extends Model
{
    use HasFactory;

    protected $table = 'messages_room';

    protected $fillable = [
        'creator_id'
    ];

    public function message()
    {
        return $this->hasMany(ModelMessage::class, 'room_id')->with('sender', 'receiver');
    }

    /**
     * Get the recent message for contact List
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function recentMessage()
    {
        return $this->hasOne(ModelMessage::class, 'room_id')
            ->with('sender', 'receiver')->orderBy('id', 'desc');
    }

    public function participant()
    {
        return $this->hasOne(ModelMessageUser::class, 'room_id')->with('creator', 'recipient');
    }
}
