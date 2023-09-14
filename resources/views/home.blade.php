@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="container">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h2>Manage <b>Users</b></h2>
                                    </div>

                                </div>
                            </div>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>

                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Display name</th>
                                        <th>Phone numbers</th>
                                        <th>Address</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($users as $user)
                                    <tr>

                                        <td>{{ $user->first_name.' '.$user->last_name }}</td>
                                        <td>{{ $user->email }}</td>
                                        <td>{{ !$user->card?'':$user->card->displayname }}</td>
                                        <td>
                                            @if($user->card)
                                                @foreach ($user->card->phonenumbers as $ph)

                                                    <div>{{$ph->number}}</div>
                                                @endforeach
                                            @endif
                                        <td>{{ !$user->card?'':$user->card->address }}</td>
                                        <td>
                                            <a href="#editEmployeeModal_{{ $user->id }}" class="edit" data-bs-toggle="modal"><i class="material-icons" data-bs-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                            <a href="#deleteEmployeeModal_{{ $user->id }}" class="delete" data-bs-toggle="modal"><i class="material-icons" data-bs-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        </td>
                                        <div id="editEmployeeModal_{{ $user->id }}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form method='POST' action='/updateuser/{{$user->id}}'>
                                                        @csrf
                                                        @method('PATCH')
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Edit Employee</h4>
                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label>First Name</label>
                                                                <input name='first_name' value='{{ $user->first_name }}' type="text" class="form-control" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Last Name</label>
                                                                <input name='last_name' value='{{ $user->last_name }}' type="text" class="form-control" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Email</label>
                                                                <input name='email' value='{{ $user->email }}' type="email" class="form-control" required>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                                            <input type="submit" class="btn btn-info" value="Save">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Delete Modal HTML -->
                                        <div id="deleteEmployeeModal_{{ $user->id }}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form method='POST' action="/deleteuser/{{$user->id}}">
                                                        @csrf
                                                        @method('delete')
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Delete Employee</h4>
                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Are you sure you want to delete these Records?</p>
                                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                                            <input type="submit" class="btn btn-danger" value="Delete">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <div class="clearfix">
                                {{ $users->links() }}

                            </div>
                        </div>
                    </div>
                    <!-- Edit Modal HTML -->
                    <div id="addEmployeeModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form>
                                    <div class="modal-header">
                                        <h4 class="modal-title">Add Employee</h4>
                                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Address</label>
                                            <textarea class="form-control" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input type="text" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-success" value="Add">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Edit Modal HTML -->

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
