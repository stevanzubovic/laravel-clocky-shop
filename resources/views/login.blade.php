@extends('layouts.formPageLayout')

@section('title')
    Clocky shop - Login
@endsection
@section('description') Login page for clocky shop. @endsection
@section('main')
    <form action="" method="POST" class="col-md-5 container lone-form">
        @csrf
        <div class="form-group">
            <label for="username" class="form-label">User name</label>
            <input type="text" name="username" id="username" class="form-control">
            <div class="invalid-feedback">
                Error text
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="form-label">Password</label>
            <input type="password" name="password" id="password" class="form-control @if(session()->has('userOrPassError')) is-invalid @endif">
            <div class="invalid-feedback">
                @if(session()->has('userOrPassError'))
                    {{ session('userOrPassError') }}
                @endif
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
@endsection

