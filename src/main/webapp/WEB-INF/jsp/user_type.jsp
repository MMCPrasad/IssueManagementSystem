
<%--
    Document   : systems
    Created on : Aug 21, 2023, 3:24:58?PM
    Author     : cpm.999cc
--%>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
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
                                    <h4>User Types</h4>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option">
                                            <li><i class="feather icon-maximize full-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-block p-b-0">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered m-b-0" id="userTypeTbl">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>User Type</th>
                                                    <th>Ent On</th>
                                                    <th>Ent by</th>
                                                    <th>Mod On</th>
                                                    <th>Mod by</th>

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
                                        <button id="addUserTypeBtn" class="btn btn-sm waves-effect waves-light btn-danger"><i class="icon feather icon-plus"></i>Add User Type</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" id="formSection" style="display: none">

                            <div class="card" style="width: 90%">
                                <div class="card-header">
                                    <h6>Add/Update User Type</h6>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option">
                                            <li><i class="feather icon-x cls-card"></i></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">

                                        <div class="form-group" style="padding-left: 10px;">
                                            <label for="name">User Type Name<span class="text-danger">*</span></label>
                                            <input id="name" type="text" name="name" class="form-control"  required autocomplete="off">
                                        </div>

                                    </div>
                                    <div class="col" >
                                        <div class="pages"  id="pg">
                                            <label for="name">Access Page<span class="text-danger">*</span></label>
                                            <div id="pages" >
                                            </div>
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
        </main>
        <%@include file="jspf/footer.jspf" %>
        <%@include file="jspf/scripts.jspf" %>
        <script  src="files/jstree/js/jstree.min.js"></script>
        <script>
            const closeBtn = document.getElementById('closeBtn');
            closeBtn.addEventListener('click', function () {
                formSection.style.display = 'none';
                tableSection.style.display = 'block';
                clearForm()
            });

            //        $.fn.dataTable.ext.errMode = 'none';
            var dtable = $('#userTypeTbl').DataTable({
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
                    "url": "admin/userType",
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
                    {"data": "name"},
                    {"data": "ent_on"},
                    {"data": "ent_by"},
                    {"data": "mod_on"},
                    {"data": "mod_by"},
                    {"data": "status"}
                ], "language": {
                    'loadingRecords': '&nbsp;',
                    'processing': '<div class="loader2"></div>'
                }, createdRow: function (row, data) {
                    let action_td = document.createElement('td');
                    $(action_td).addClass('text-center');
                    if (data['status'] === 'deactivate') {
                        $(action_td).append('<a href="javascript:void(0)" class="rerec"><i class="fas fa-check  text-success"></i></a>');
                    } else {
                        $(action_td).append('<a href="javascript:void(0)" style="padding-right: 15px;" class="editrec"><i class="far fa-edit text-c-green"></i></a><a href="javascript:void(0)" class="delrec"><i class="far fa-trash-alt f-w-600 f-16 text-danger"></i></a>');
                    }

                    $(row).append(action_td);
                    setTableStatus($(row).find('td').eq(5));
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



            $('#addUserTypeBtn').click(function () {
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


            fetch('admin/getpages', {
                method: 'POST',
            })
                    .then(resp => resp.json())
                    .then(resp => {
                        let data = JSON.parse(resp.allPage);
                        data.sort((a, b) => a.odr - b.odr);

                        for (var i = 0; i < data.length; i++) {
                            if (data[i].parent) {
                                data[i].parent = data[i].parent.toString();
                            } else {
                                data[i].parent = '#';
                            }

                            if (data[i].children) {
                                data[i].children.sort((a, b) => a.odr - b.odr);
                            }
                        }

                        console.log(data);

                        $("#pages").jstree('destroy');
                        $('#pages').jstree({
                            'core': {
                                'themes': {
                                    'responsive': false
                                },
                                'data': data,
                                'check_callback': true
                            },
                            'types': {
                                'default': {
                                    'icon': 'feather icon-chevron-right'
                                },
                                'file': {
                                    'icon': 'feather icon-chevron-right'
                                }
                            },
                            'plugins': ['types', 'checkbox'],
                            'checkbox': {
                                'keep_selected_style': false
                            },
                            'check_callback': true,
                            'dnd': {
                                'is_draggable': function (node) {
                                    return false;
                                }
                            },
                            'core': {
                                'data': data.map(item => ({
                                        id: item.id,
                                        parent: item.parent,
                                        text: item.name,
                                        name: item.name
                                    })),
                                'check_callback': true
                            },
                            'render': {
                                'item': function (node, data) {
                                    var checkbox = '<i class="jstree-checkbox"></i>';
                                    var text = '<span class="jstree-text">' + data.node.text + '</span>';
                                    var name = '<span class="jstree-name">' + data.node.original.name + '</span>';

                                    return '<li>' + checkbox + text + ' ' + name + '</li>';
                                }
                            }
                        }).on('loaded.jstree', function () {
                            $(this).jstree('open_all');
                        });
                    });


            $('#saveBtn').click(function () {

                if ($('#name').val().trim() === '') {
                    Swal.fire("Empty Name!", "Please Enter a Valid User Type Name !", "warning");
                    return;
                }



                let page = $("#pages").jstree("get_json");
                let selectPages = [];

                for (var i = 0; i < page.length; i++) {
                    let level1 = page[i];
                    if (level1.state.selected) {
                        selectPages.push(level1.id);
                    }
                    for (var j = 0; j < level1.children.length; j++) {
                        let level2 = level1.children[j];
                        if (level2.state.selected) {
                            selectPages.push(level2.id);
                        }
                        for (var k = 0; k < level2.children.length; k++) {
                            let level3 = level2.children[k];
                            if (level3.state.selected) {
                                selectPages.push(level3.id);
                            }
                        }
                    }

                }




                if ($('#saveBtn').data('mode') === 'save') {
                    loadDiv($('#formSection').find('.card'));


                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You are about to save a User Type!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, Save!',
                        showLoaderOnConfirm: true,
                        allowOutsideClick: () => !Swal.isLoading(),
                        preConfirm: () => {
                            return fetch('admin/user-type-save', {
                                method: 'POST',
                                body: new URLSearchParams({
                                    name: document.getElementById('name').value,
                                    //                                dashboard: document.getElementById('dashboard').value,
                                    pages: JSON.stringify(selectPages)
                                })
                            }).then(response => {
                                if (!response.ok) {
                                    throw new Error(response.statusText);
                                    finishLoadDiv($('#formSection').find('.card'));
                                }
                                return response.json();
                            }).catch(error => {
                                Swal.showValidationMessage('Request failed:' + error);
                                finishLoadDiv($('#formSection').find('.card'));
                            });
                        },
                        allowOutsideClick: () => !Swal.isLoading()
                        //                                        finishLoadDiv($('#formSection').find('.card'));
                    }).then((result) => {
                        if (result.value) {
                            if (result.value.status !== 200) {
                                Swal.fire('Error!', result.value.msg, 'error');
                                finishLoadDiv($('#formSection').find('.card'));
                            } else {
                                Swal.fire('Successfull!', 'User Type has been Saved !', 'success');
                                dtable.ajax.reload();
                                clearForm();
                                $('#tableSection').fadeIn();
                                $('#formSection').hide();
                                finishLoadDiv($('#formSection').find('.card'));
                            }
                        }
                        finishLoadDiv($('#formSection').find('.card'));
                    });
                } else if ($('#saveBtn').data('mode') === 'update') {
                    loadDiv($('#formSection').find('.card'));
                    $('#saveBtn').data('id');
                    //                        formData.append('data', JSON.stringify(data));

                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, Update!',
                        showLoaderOnConfirm: true,
                        allowOutsideClick: () => !Swal.isLoading(),
                        preConfirm: () => {
                            return fetch('admin/user-type-update', {
                                method: 'POST',
                                body: new URLSearchParams({
                                    id: $('#saveBtn').data('id'),
                                    name: document.getElementById('name').value,
                                    pages: JSON.stringify(selectPages)
                                })
                            }).then(response => {
                                if (!response.ok) {
                                    throw new Error(response.statusText);
                                }
                                return response.json();
                            }).catch(error => {
                                Swal.showValidationMessage('Request failed:' + error);
                                finishLoadDiv($('#formSection').find('.card'));
                            });
                        },
                        allowOutsideClick: () => !Swal.isLoading()
                    }).then((result) => {
                        if (result.value) {
                            if (result.value.status !== 200) {
                                Swal.fire('Error!', result.value.msg, 'error');
                                finishLoadDiv($('#formSection').find('.card'));
                            } else {
                                Swal.fire('Successfull!', 'User Type has been updated !', 'success');
                                dtable.ajax.reload();
                                clearForm();
                                $('#tableSection').fadeIn();
                                $('#formSection').hide();
                                finishLoadDiv($('#formSection').find('.card'));
                            }
                        }
                    });
                }

            });

            $(document).on('click', '.editrec', function () {

                let id = $(this).parents('tr').eq(0).data('id');
                $('#saveBtn').data('id', id);

                $.post('admin/get-userType', {id: id}, function (result) {



                    $('#name').val(result.name);
                    $('#dashboard').val(result.dashboard).change();



                    let data = JSON.parse(result.allPage);
                    data.sort((a, b) => a.odr - b.odr);

                    for (var i = 0; i < data.length; i++) {
                        if (data[i].parent) {
                            data[i].parent = data[i].parent.toString();
                        } else {
                            data[i].parent = '#';
                        }

                        if (data[i].children) {
                            data[i].children.sort((a, b) => a.odr - b.odr);
                        }
                    }

                    $("#pages").jstree('destroy');
                    $('#pages').jstree({
                        'core': {
                            'themes': {
                                'responsive': false
                            },
                            'data': data,
                            'check_callback': true
                        },
                        'types': {
                            'default': {
                                'icon': 'feather icon-chevron-right'
                            },
                            'file': {
                                'icon': 'feather icon-chevron-right'
                            }
                        },
                        'plugins': ['types', 'checkbox'],
                        'checkbox': {
                            // 'keep_selected_style': true
                        },
                        'check_callback': true,
                        'dnd': {
                            'is_draggable': function (node) {
                                return false;
                            }
                        },
                        'core': {
                            'data': data.map(item => ({
                                    id: item.id,
                                    parent: item.parent,
                                    text: item.name,
                                    name: item.name,
                                    state: item.state
                                })),
                            'check_callback': true
                        },
                        'render': {
                            'item': function (node, data) {
                                var checkbox = '<i class="jstree-checkbox"></i>';
                                var text = '<span class="jstree-text">' + data.node.text + '</span>';
                                var name = '<span class="jstree-name">' + data.node.original.name + '</span>';

                                return '<li>' + checkbox + text + ' ' + name + '</li>';
                            }
                        }
                    }).on('loaded.jstree', function () {
                        $(this).jstree('open_all');
                    });
                    //                        }

                });


                $('#tableSection').hide();
                $('#formSection').fadeIn();
                $('#saveBtn').data('mode', 'update');
                $('#saveBtn').html('Update User Type');
            });


            $(document).on('click', '.delrec', function ()
            {
                let id = $(this).parents('tr').data('id');
                console.log(id);
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This User Type Will be Deleted!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('admin/deactivate-user-Type', {
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
                            Swal.fire('Successfull!', 'User Type has been Deactivated !', 'success');
                            dtable.ajax.reload();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                        }
                    }
                });
            });
            $(document).on('click', '.rerec', function ()
            {
                let id = $(this).parents('tr').data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This User Type Will be Activated!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('admin/reactivate-user-Type', {
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
                            Swal.fire('Successfull!', 'User Type has been Activated !', 'success');
                            dtable.ajax.reload();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                        }
                    }
                });
            });
            function clearForm() {
                // Clear the value of the input field with id 'name'
                $('#name').val('');

                // Clear the selected value of the dropdown with id 'dashboard'
                $('#dashboard').val('').trigger('change');

                // Clear the selected nodes in the jstree with id 'pages'
                var tree = $('#pages').jstree(true);
                var selectedNodes = tree.get_selected();
                selectedNodes.forEach(function (nodeId) {
                    tree.deselect_node(nodeId);
                });
            }


        </script>
    </body>
</html>
