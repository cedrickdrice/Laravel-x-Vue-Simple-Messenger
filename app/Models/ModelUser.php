<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelUser extends Model
{
    use HasFactory;

    protected $table = 'users';

    public function messages()
    {
        return $this->hasMany(ModelMessageUser::class, 'receiver_id');
    }
}
