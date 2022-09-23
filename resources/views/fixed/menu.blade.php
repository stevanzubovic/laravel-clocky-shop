<nav class="navbar navbar-expand-lg navbar-dark bg-dark" role="navigation">
        @foreach($menu as $item)
            @if(session()->has('user') && $item->displayed_text == 'user')
                <a href="{{ route($item->route) }}" class="nav-link link-light flex"> <i class="fa-solid fa-circle-user"></i> </a>
            @elseif(!session()->has('user') && $item->displayed_text == 'user')
                @continue
            @elseif(session()->has('user') && $item->displayed_text == 'login')
                @continue
            @elseif(session()->has('user') && $item->displayed_text == 'register')
                @continue
            @elseif(session()->has('user') && $item->displayed_text == 'logout')
                <a href="{{ route($item->route) }}" class="nav-link link-light">{{ ucfirst($item->displayed_text) }}</a>
            @elseif(!session()->has('user') && $item->displayed_text == 'logout')
                @continue
            @elseif( (!session()->has('user') || session()->get('user')->roleId !== 2) && $item->displayed_text == 'admin')
               @continue
            @else
                <a href="{{ route($item->route) }}" class="nav-link link-light">{{ ucfirst($item->displayed_text) }}</a>
            @endif
        @endforeach
{{--            <a href="{{ asset('Clocky shop documentation.pdf') }}" class="nav-link link-light">Docs</a>--}}

</nav>
