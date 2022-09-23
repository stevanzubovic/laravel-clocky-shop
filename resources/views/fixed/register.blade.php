@extends('layouts.formPageLayout')

@section('title')
    Clocky shop - Register
@endsection
@section('description') Registration page for clocky shop. @endsection
@section('main')
    {{ session('userName') }}
    <form action="" method="POST" class="col-md-5 container lone-form">
        @csrf
        <div class="form-group">
            <label for="username" class="form-label">User name</label>
            <input type="text" name="username" id="username" class="form-control @if(session('userName')) is-invalid @else @endif">
            <div class="invalid-feedback">
                {{ session('userName') }}
            </div>
        </div>

        <div class="form-group">
            <label for="email" class="form-label">Email</label>
            <input type="text" name="email" id="email" class="form-control @if(session('email')) is-invalid @endif">
            <div class="invalid-feedback">
                {{ session('email') }}
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="form-label">Password</label>
            <input type="password" name="password" id="password" class="form-control">
            <div class="invalid-feedback">
                Error text
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
@endsection

