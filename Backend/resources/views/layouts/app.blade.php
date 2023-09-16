<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>


    <style>
        body{
            background-image: url(https://img.freepik.com/free-vector/white-abstract-wallpaper_23-2148830026.jpg?w=2000);
            background-size: 100%;
            background-repeat:repeat-y;
        }
.card-container{
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}
       .card{
    display: inline-flex;
    flex-direction: column;
    align-content: center;
    flex-wrap: nowrap;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
}
.card-header{
    background: transparent;
    width: 100%;
    backdrop-filter: blur(30px);
    border-bottom: 0px;
    text-align: center;
    font-size: 1.3rem;
    font-weight: bold;
    text-transform: uppercase;
    border-top-left-radius: 30px !important;
    border-top-right-radius: 30px !important;

}

.card-body{

      border-radius: 15px;
    background: transparent;
    width: 100%;
    backdrop-filter: blur(30px);

}
.card{
    box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
    background: transparent;
      border-radius: 15px;
}
.mb-3{
    flex-direction: column;
    align-content: center;
    justify-content: center;
    flex-wrap: wrap;
}
.mb-0{
    justify-content: center;
}
.mb-0 button{
    width: 100%

}
    </style>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Admin Dashboard</title>
    {{-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> --}}

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->

    <link href="https://fonts.googleapis.com/css2?family=Material+Icons&display=swap" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    Admin Dashboard
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav me-auto">

                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ms-auto">
                        <!-- Authentication Links -->
                        @if(! Auth::guard('web')->check())
                            @if (Route::has('login'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                                </li>
                            @endif

                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                </li>
                            @endif
                        @else

                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('logout') }}">{{ __('Logout') }}</a>
                        </li>


                        @endif
                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4">
            @yield('content')
        </main>
    </div>
    {{-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script> --}}
    {{-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script> --}}

</body>
</html>
