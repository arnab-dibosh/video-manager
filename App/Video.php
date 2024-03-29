<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    protected $fillable = [
    'title', 'link',
    ];

    public function categories()
    {
        return $this->belongsToMany('App\Category');
    }
}
