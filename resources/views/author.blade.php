@extends('layouts.formPageLayout')

@section('title')
    Author - Clocky shop
@endsection
@section('description') Author page for clocky shop. @endsection
@section('main')
    <div class="row justify-content-center p-3">
        <div class="col-3">
            <img src="{{ asset('assets/images/author.JPG') }}" alt="">
        </div>
        <div class="col-4 text-center text-lg-start" style="margin-top: 100px">
            <p>
                Stvan Zubović is the author of this website. As an aspiring web developer Stevan always hoped he could
                do a heavily rushed Laravel project. This website made the dream a reality.
            </p>
        </div>
    </div>
@endsection
