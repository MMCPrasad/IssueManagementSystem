
<%--
    Document   : systems
    Created on : Aug 21, 2023, 3:24:58 PM
    Author     : cpm.999cc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="jspf/header.jspf" %>
        <style>
            .card {
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            .card-container .col {
                padding: 0;
            }

            .card-body {
                height: 100%;
                display: flex;
                flex-direction: column;
                padding: 1rem;
            }

            .text {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }


            .small-font {
                font-size: 12px; /* Adjust font size as needed */
                font-weight: 600;
            }
            .card-footer {
                display: flex;
                justify-content: flex-end;
                padding: 1rem;
            }
            .text-right {
                margin-left: auto;
            }
            .card-col {
                margin: 0 5px; /* Adjust the margin as needed */
            }
        </style>
    </head>
    <body>

        <main class="main" id="top">
            <div class="container-fluid" data-layout="container">
                <%@include file="jspf/sidebar.jspf" %>

                <div class="content">
                    <%@include file="jspf/navbar.jspf" %>

                    <div class="container-fluid">
                        <div class="row" id="tableSection">


                            <div class="card">
                                <div class="card-header">
                                    <h4>Users</h4>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option">
                                            <li><i class="feather icon-maximize full-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-block p-b-0">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered m-b-0" id="tbll">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Username</th>
                                                    <th>User</th>

                                                    <th>Ent On</th>
                                                    <th>Ent By</th>
                                                    <th>User Type</th>
                                                    <th>Company</th>
                                                    <th>Mod On</th>
                                                    <th>Mod By</th>
                                                    <th style="width:1px;">Status</th>
                                                    <th style="width:1px;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="text-right">
                                        <button id="addUserBtn" class="btn btn-sm waves-effect waves-light btn-danger"><i class="icon feather icon-plus"></i>Add User</button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="" id="formSection" style="display: none">

                            <div class="card" >
                                <div class="card-block p-b-0" style="padding: 2em">
                                    <div class="card-header">

                                        <div class="card-header-right">
                                            <ul class="list-unstyled card-option">
                                                <li><i class="feather icon-x cls-card"></i></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="name">Name<span class="text-danger">*</span></label>
                                                <input id="name" type="text" name="name" class="form-control"  required autocomplete="off">
                                            </div> 
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="username">Username<span class="text-danger">*</span></label>
                                                <input id="username"  type="text" name="username" class="form-control" required autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="email">Email<span class="text-danger">*</span></label>
                                                <input id="email"  type="text" name="email" class="form-control" required autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="user_type">User Type<span class="text-danger">*</span></label>
                                                <select id="user_type" name="user_type" class="" required autocomplete="off">
                                                </select>
                                            </div>
                                        </div>
                                    </div>




                                    <div class="row">
                                        <div class="col">
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="company">Company<span class="text-danger">*</span></label>
                                                    <select id="company" name="company" class="" required autocomplete="off">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="department">Department<span class="text-danger">*</span></label>
                                                <select id="department" name="department" class="" required autocomplete="off">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group" style="padding-bottom: 2rem">
                                                <label for="company">Dashboard<span class="text-danger">*</span></label>
                                                <select class="form-control-sm pull-right" id="dashboard">  </select>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group" style="padding-bottom: 2rem">
                                                <label for="company">Access Type<span class="text-danger">*</span></label>
                                                <select class="form-control-sm pull-right" id="access">  </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-footer d-flex justify-content-end">
                                        <button id="saveBtn" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                                        <button id="closeBtn" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>                          
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </main>


        <%@include file="jspf/footer.jspf" %>
        <%@include file="jspf/scripts.jspf" %>

        <script>
            const closeBtn = document.getElementById('closeBtn');
            closeBtn.addEventListener('click', function () {
                formSection.style.display = 'none';
                tableSection.style.display = 'block';
                clearForm()
            });

            var typeIssue = new SlimSelect({
                select: '#dashboard',
                placeholder: "Select Dashboard",
                ajax: function (search, callback) {
                    fetch('admin/dashbaord-type', {
                        method: 'POST',
                        body: new URLSearchParams({search: search || ''})
                    }).then(res => res.json()).then((data) => {
                        callback(data);
                    });
                },
                allowDeselect: true,
                deselectLabel: '<span class="red">✖</span>'
            });
            var company = new SlimSelect({
                select: '#company',
                placeholder: "Company",
                ajax: function (search, callback) {
                    fetch('company/company-select', {
                        method: 'POST',
                        body: new URLSearchParams({search: search || ''})
                    }).then(res => res.json()).then((data) => {
                        callback(data);
                    });
                },
                allowDeselect: true,
                deselectLabel: '<span class="red">✖</span>'
            });
            var dptmnt = new SlimSelect({
                select: '#department',
                placeholder: "Department",
                ajax: function (search, callback) {
                    fetch('company/company-select-departments', {
                        method: 'POST',
                        body: new URLSearchParams({search: search || ''})
                    }).then(res => res.json()).then((data) => {
                        callback(data);
                    });
                },
                allowDeselect: true,
                deselectLabel: '<span class="red">✖</span>'
            });


            var access = new SlimSelect({
                select: '#access',
                placeholder: "Access Type",
                ajax: function (search, callback) {
                    fetch('company/access-type', {
                        method: 'POST',
                        body: new URLSearchParams({search: search || ''})
                    }).then(res => res.json()).then((data) => {
                        callback(data);
                    });
                },
                allowDeselect: true,
                deselectLabel: '<span class="red">✖</span>'
            });


            $.fn.dataTable.ext.errMode = 'none';

            var dtable = $('#tbll').DataTable({
                "aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
                "pageLength": 5,
                "ordering": true,
                "autoWidth": false,
                "processing": true,
                "serverSide": true,
                "order": [[0, "desc"]],
                "searchHighlight": true,
                "searchDelay": 350,
                "ajax": {
                    "url": "admin/users",
                    "contentType": "application/json",
                    "type": "POST",
                    "data": function (d) {
                        return JSON.stringify(d);
                    },
                    error: function (xhr, error, code) {
                        console.log(xhr);
                        console.log(code);
                    }
                },
                "columns": [
                    {"data": "id", className: "text-right", "visible": false},
                    {"data": "username"},
                    {"data": "name"},

                    {"data": "ent_on"},
                    {"data": "ent_by"},
                    {"data": "usertype"},
                    {"data": "company"},
                    {"data": "mod_on"},
                    {"data": "mod_by"},
                    {"data": "status"}
                ], "language": {
                    'loadingRecords': '&nbsp;',
                    'processing': '<div class="loader2"></div>'
                }, "createdRow": function (row, data) {
                    let action_td = document.createElement('td');
                    $(action_td).addClass('text-center');
                    if (data['status'] === 'deactivate') {
                        $(action_td).append('<a href="javascript:void(0)" class="rerec"><i class="fas fa-check  text-success"></i></a>');
                    } else {
                        $(action_td).append('<a href="javascript:void(0)" style="padding-right: 15px;" class="editrec"><i class="far fa-edit text-c-green"></i></a><a href="javascript:void(0)" class="delrec"><i class="far fa-trash-alt f-w-600 f-16 text-danger"></i></a>');
                    }
                    $(row).append(action_td);

                    setTableStatus($(row).find('td').eq(8));
                    $(row).data('id', data['id']);
                }
            });

            function setTableStatus(td) {
                var htmlContent = $(td).html();
                if (htmlContent && htmlContent.trim().startsWith('active')) {
                    $(td).html('<label class="label label-success" style="white-space: nowrap">Active</label>');
                } else if (htmlContent === 'deactivate') {
                    $(td).html('<label class="label label-danger" style="white-space: nowrap">Deactivate</label>');
                }
            }


            $('#addUserBtn').click(function () {
                $('#saveBtn').data('mode', 'save');
                $('#saveBtn').html('<i class="icon feather icon-save"></i>Save');
                clearForm();
                $('#tableSection').hide();
                $('#formSection').fadeIn();
            });
            $('.cls-card').click(function () {
                $('#formSection').hide();
                $('#tableSection').fadeIn();
            });

            function clearForm() {
                document.getElementById('name').value = '';
                document.getElementById('username').value = '';
                document.getElementById('email').value = '';
                document.getElementById('user_type').selectedIndex = 0;
                document.getElementById('company').selectedIndex = 0;
                document.getElementById('dashboard').selectedIndex = 0;

            }

            var user_type = new SlimSelect({
                select: '#user_type',
                placeholder: "Select a Usertype",
                searchHighlight: true,

                ajax: function (search, callback) {
                    fetch('admin/search-user-types', {
                        method: 'POST',
                        body: new URLSearchParams({search: search || ''})
                    }).then(res => res.json()).then((data) => {
                        callback(data);
                    });
                },
                allowDeselect: true,
                deselectLabel: '<span class="red">✖</span>'
            });
            $('#user_type').data('select', user_type);

            $(document).on('click', '.editrec', function () {
                loadDiv($('#tableSection'));
                let id = $(this).parents('tr').data('id');
                fetch('admin/user/' + id)
                        .then(resp => resp.json())
                        .then(data => {
                            console.log('Fetched data:', data); // Log the fetched data

                            if (data && data.data && data.data.obj) {
                                let obj = data.data.obj;
                                clearForm();
                                $('#name').val(obj.name);
                                $('#username').val(obj.username);
                                $('#email').val(obj.email);

                                $('#saveBtn').data('mode', 'update');
                                $('#saveBtn').html('<i class="icon feather icon-save"></i>Update');
                                $('#saveBtn').data('id', id);
                                $('#formSection').fadeIn();
                                $('#tableSection').hide();
                            } else {
                                console.error('Error: obj is undefined in the response data');
                            }

                            finishLoadDiv($('#tableSection'));
                        })
                        .catch(error => {
                            console.error('Error fetching user data:', error);
                            finishLoadDiv($('#tableSection'));
                        });
            });
            function saveUser() {
                // Disable the saveBtn
                $('#saveBtn').prop('disabled', true);

                var userData = {
                    name: document.getElementById('name').value,
                    username: document.getElementById('username').value,
                    email: document.getElementById('email').value,
                    usertype: document.getElementById('user_type').value,
                    company: document.getElementById('company').value,
                    dashboard: document.getElementById('dashboard').value,
                    access: document.getElementById('access').value,
                    department: document.getElementById('department').value,
                };

                fetch('admin/save-user', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(userData)
                })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            } else {
                                return response.json();
                            }
                        })
                        .then(data => {
                            // Enable the saveBtn
                            $('#saveBtn').prop('disabled', false);

                            console.error('Error:', error);
                            Swal.fire('Error!', 'An error occurred while saving the user', 'error');

                        })
                        .catch(error => {
                            Swal.fire('Successful!', 'User has been successfully saved', 'success');
                            clearForm();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                            dtable.ajax.reload();
                            // Enable the saveBtn in case of error
                            $('#saveBtn').prop('disabled', false);
                        });
            }


// Function for updating a user
            function updateUser() {
                return fetch('admin/update-user', {
                    method: 'POST',
                    body: new URLSearchParams({
                        id: $('#saveBtn').data('id'),
                        name: document.getElementById('name').value,
                        username: document.getElementById('username').value,
                        email: document.getElementById('email').value,
                        usertype: document.getElementById('user_type').value,
                        company: document.getElementById('company').value,
                        dashboard: document.getElementById('dashboard').value,
                        access: document.getElementById('access').value,
                        department: document.getElementById('department').value,
                    })
                })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            } else {
                                Swal.fire('Successful!', 'User has been successfully updated', 'success');
                                clearForm();
                                $('#formSection').hide();
                                $('#tableSection').fadeIn();
                                dtable.ajax.reload();
                            }
                            return response.json();
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            Swal.fire('Error!', 'An error occurred while updating the user', 'error');
                        });
            }



            $('#saveBtn').click(function () {
                if ($('#name').val().trim() === '') {
                    Swal.fire("Empty Name!", "Please Enter a Valid Name!", "warning");
                    return;
                }
                if ($('#username').val().trim() === '') {
                    Swal.fire("Empty Username!", "Please Enter a Valid Username!", "warning");
                    return;
                }
                if ($('#email').val().trim() === '') {
                    Swal.fire("Empty email!", "Please Enter a Valid email!", "warning");
                    return;
                }
                if ($('#user_type').val() === null) {
                    Swal.fire("UserType not Selected!", "Please Select a UserType!", "warning");
                    return;
                }
                if ($('#company').val() === null) {
                    Swal.fire("Company not Selected!", "Please Select a Company!", "warning");
                    return;
                }
                if ($('#dashboard').val() === null) {
                    Swal.fire("Dashboard not Selected!", "Please Select a Dashboard!", "warning");
                    return;
                }
                if ($('#access').val() === null) {
                    Swal.fire("Access Type not Selected!", "Please Select a Type!", "warning");
                    return;
                }
                if ($('#department').val() === null) {
                    Swal.fire("Department not Selected!", "Please Select a Department!", "warning");
                    return;
                }

                var mode = $(this).data('mode'); // Get the mode from the data attribute of the button

                if (mode === 'save') {
                    saveUser(); // Call saveUser function if mode is 'save'
                } else if (mode === 'update') {
                    updateUser(); // Call updateUser function if mode is 'update'
                } else {
                    console.error('Invalid mode specified.');
                }
            });


            $(document).on('click', '.delrec', function () {
                let id = $(this).parents('tr').data('id');
                console.log(id);
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This User Will be Deleted!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('admin/deactivate-user', {
                            method: 'POST',
                            body: new URLSearchParams({
                                id: id
                            })
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            }
                            return response.json();
                        }).catch(error => {
                            Swal.showValidationMessage('Request failed:' + error);
                        });
                    },
                    allowOutsideClick: () => !Swal.isLoading()

                }).then((result) => {
                    if (result.value) {
                        if (result.value.status !== 200) {
                            Swal.fire('Error!', result.value.msg, 'error');
                        } else {
                            Swal.fire('Successfull!', 'User has been Deactivated !', 'success');
                            dtable.ajax.reload();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                        }
                    }
                });
            });

            $(document).on('click', '.rerec', function () {
                let id = $(this).parents('tr').data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This User Will be Activated!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('admin/reactivate-user', {
                            method: 'POST',
                            body: new URLSearchParams({
                                id: id
                            })
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            }
                            return response.json();
                        }).catch(error => {
                            Swal.showValidationMessage('Request failed:' + error);
                        });
                    },
                    allowOutsideClick: () => !Swal.isLoading()

                }).then((result) => {
                    if (result.value) {
                        if (result.value.status !== 200) {
                            Swal.fire('Error!', result.value.msg, 'error');
                        } else {
                            Swal.fire('Successfull!', 'User has been Activated !', 'success');
                            dtable.ajax.reload();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                        }
                    }
                });
            });

            $.fn.dataTable.Debounce = function (table) {
                var tableId = table.settings()[0].sTableId;
                $('.dataTables_filter input[aria-controls="' + tableId + '"]')
                        .unbind()
                        .bind('input', (delay(function (e) {
                            table.search($(this).val()).draw();
                            return;
                        }, 500)));
            };

            function delay(callback, ms) {
                var timer = 0;
                return function () {
                    var context = this, args = arguments;
                    clearTimeout(timer);
                    timer = setTimeout(function () {
                        callback.apply(context, args);
                    }, ms || 0);
                };
            }

            var debounce = new $.fn.dataTable.Debounce(dtable);

        </script>



    </body>
</html>