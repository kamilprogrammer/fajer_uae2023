<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Behaviour extends Model
{
    use HasFactory;

    protected $fillable = ['user_id' , 'title' , 'body'];

    public function student(){
        return $this->belongsTo(User::class);
    }
}
