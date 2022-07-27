<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelMessageUser extends Model
{
    use HasFactory;

    protected $table = 'messages_user';

    protected $fillable = [
        'user_id',
        'recipient_id'
    ];


    public function room()
    {
        return $this->belongsTo(ModelMessageRoom::class, 'room_id');
    }

    public function creator()
    {
        return $this->belongsTo(ModelUser::class, 'user_id');
    }

    public function recipient()
    {
        return $this->belongsTo(ModelUser::class, 'recipient_id');
    }

}
