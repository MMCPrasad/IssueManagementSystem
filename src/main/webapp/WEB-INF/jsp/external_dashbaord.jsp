<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accelution - IMS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
        <link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
        <link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
        <link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <%@include file="jspf/header.jspf" %>
        <style>
            .cards {
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 5px;
                transition: transform 0.2s;
            }
            .widget-visitor-card {
                padding: 10px;
                text-align: center;
            }
            .card-block-small,
            .card-block-large {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100%;
            }
            .card-block-small h4,
            .card-block-large h4 {
                margin: 0;
                font-size: 24px;
            }
            .card-block-small h6,
            .card-block-large h6 {
                margin: 0;
                font-size: 14px;
            }
            .feather {
                margin-top: 50px;
                transition: transform 0.2s; /* Smooth transition for hover effect */
            }

            .card-block-large .feather {
                width: 74px; /* Larger size for the large card block */
                height: 74px; /* Larger size for the large card block */
            }
            .placeholder {
                background-color: white;
                color: black;
            }

            hr {
                height: 2px; /* Set the height of the hr to 2 pixels */
                border: none; /* Remove the default border */
                background-color: black; /* Optional: Set the background color of the hr */
            }

            h6{
                margin-bottom: .5rem;
                font-family: inherit;
                font-weight: 500;
                line-height: 1.1;
                color: white;
                font-weight: 400;
                font-size: 1.2rem;
            }
            .cards .card-block-small {
                padding: 15px 20px;
            }
            .cards {
                position: relative;
                overflow: hidden;
                cursor: pointer;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
                transition: transform 0.3s ease; /* Add a transition for the transform property */
                /*margin-left: 30px;*/

            }

            .cards:hover {
                transform: translateY(-5px); /* Move the card up slightly on hover */
            }

            .cards::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                transition: all 0.3s ease;
                opacity: 0;
                transform: translateY(100%);
                overflow: hidden;
                padding: 10px 0;
                background-color: rgba(255, 255, 255, 0.9); /* Add a background color for the "like" popup */
                border-radius: 10px; /* Match the border-radius of the card */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5); /* Match the box-shadow of the card */
            }

            .cards:hover::before {
                opacity: 1;
                transform: translateY(-100%); /* Move the "like" popup up */
            }


            .cards i {
                position: absolute;
                bottom: 10px;
                left: -20px;
                transition: all 0.3s ease;
                transform-origin: bottom left;
                transform: scale(3.5) ;
                opacity: 0.5; /* Set the opacity to 50% */
            }

            .cards:hover i {
                transform: rotate(15deg) scale(5);
                opacity: 0.5; /* Set the opacity to 100% on hover */
            }

            .card-registration .select-input.form-control[readonly]:not([disabled]) {
                font-size: 1rem;
                line-height: 2.15;
                padding-left: .75em;
                padding-right: .75em;
            }
            .card-registration .select-arrow {
                top: 13px;
            }
            .card{
                /*width: 90em;*/
                justify-content: center;
                margin: auto;

            }
            .pagetitle h3 {
                font-size: 28px;
                margin-bottom: 0;
                font-weight: 600;
                color: #31d422;
            }
        </style>
    </head>
    <body>


        <div class="main" id="tableSection">
            <div class="row " style="margin-bottom: 1px;padding: 0rem 0rem;">
                <div class="col-12 card" >
                    <h4 style="padding: 0.5rem 2rem;">Ticket Management System</h4>
                </div>
            </div>
            <%@include file="jspf/navbar.jspf" %>
            <section class="navi-card" style="padding: 0rem 2rem;">

                <div class="row" style="margin-top: 1rem;">
                    <div class="col">
                        <div class="cards bg-c-info  text-white widget-visitor-card cardActive" id="allcrd" style="height: 110px;background: linear-gradient(to right, #007bff, #5ba9fd);">
                            <div class="card-block-small text-center">
                                <h4 id="all">0</h4>
                                <h6>All Ticket</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-align-center"><line x1="18" y1="10" x2="6" y2="10"></line><line x1="21" y1="6" x2="3" y2="6"></line><line x1="21" y1="14" x2="3" y2="14"></line><line x1="18" y1="18" x2="6" y2="18"></line></svg>
                                </i>
                            </div>
                        </div>
                    </div>

                    <div class="col" >
                        <div class="cards bg-c-yellow text-white widget-visitor-card" id="quecrd" style="height: 110px; background: linear-gradient(to right,#f2c71b, #f5d862);">
                            <div class="card-block-small text-center" >
                                <h4 id="acknowledgment">0</h4>
                                <h6>Open</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>
                    <div class="col" >
                        <div class="cards bg-c-yellow text-white widget-visitor-card" id="quecrd" style="height: 110px; background: linear-gradient(to right,#24D5DB, #81D8DB);">
                            <div class="card-block-small text-center" >
                                <h4 id="acknowledgment">0</h4>
                                <h6>Pending Deployment</h6>
                                <i class="feather ">

                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book-open"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg></i>
                            </div>
                        </div>
                    </div>
                    <!--                    <div class="col" >
                                            <div class="cards bg-c-pink  text-white widget-visitor-card" id="devcrd" style="height: 110px;background: linear-gradient(to right, #4eb9ed, #a7d8f0);">
                                                <div class="card-block-small text-center">
                                                    <h4 id="filepending">0</h4>
                                                    <h6>Development Pending</h6>
                                                    <i class="feather ">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                                                    </i>
                                                </div>
                                            </div>
                                        </div>-->
                    <div class="col" >
                        <div class="cards  bg-c-green text-white widget-visitor-card" id="testcrd" style="height: 110px;    background: linear-gradient(to right, #fe9365, #feb798);">
                            <div class="card-block-small text-center">
                                <h4 id="undertaking">0</h4>
                                <h6>Testing Pending</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>


                    <!--                    <div class="col" >
                                            <div class="cards   bg-c-lite-green text-white widget-visitor-card" id="approvecrd" style="height: 110px;background: linear-gradient(to right, #01a9ac, #01dbdf);">
                                                <div class="card-block-small text-center">
                                                    <h4 id="pay">0</h4>



                                                    <h6>QA Pending</h6>
                                                    <i class="feather ">

                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
                                                    </i>
                                                </div>
                                            </div>

                                        </div>-->

                    <div class="col">
                        <div class="cards bg-c-yellow text-white widget-visitor-card" id="cmplcrd" style="height: 110px; background: linear-gradient(to right, #0ac282, #0df3a3);">
                            <div class="card-block-small text-center" >
                                <h4 id="complt">0</h4>
                                <h6>Completed</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                                </i>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="cards bg-c-pink  text-white widget-visitor-card" id="rejcrd" style="height: 110px;background: linear-gradient(to right, #fe5d70, #fe909d);">
                            <div class="card-block-small text-center">
                                <h4 id="reject">0</h4>
                                <h6>Closed</h6>
                                <i class="feather ">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-octagon"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>
                                </i>
                            </div>
                        </div>
                    </div>


                </div>



                <hr>

            </section>

            <section class="tab-details"style="padding: 0rem 1rem;">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card" id="tableCard">
                            <div class="card-body" >
                                <h5 id="main_name_tag">Ticket Management System</h5>
                                <hr>

                                <div id="table_card">
                                    <table class="table table-bordered table-sm" id="issue_table" style="width: 100%; font-size: small">
                                        <thead>
                                            <tr>
                                                <th style="display: none">ID</th>
                                                <th>Reference Number</th>
                                                <th>Issue Type</th>
                                                <th>Description</th>
                                                <th>Priority</th>
                                                <th>ENT Date</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="text-right">
                                    <button id="addFmrBtn" class="btn btn-sm waves-effect waves-light btn-danger"><i class="icon feather icon-plus"></i>Add Ticket</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>



        </div>
        <div class="" id="formSection" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-deading">
                    <h3 style="text-align: center;">New Issue</h3>
                </div>
                <div class="card-block p-b-0" >

                    <div class="row">
                        <div class="col">
                            <div class="form-group" style="padding-bottom: 2rem">
                                <label for="" class="col-sm-4 col-form-label allFontByCustomerEdit">Issue Type</label>
                                <select class="form-control-sm pull-right" id="typeIssue">  </select>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group" style="padding-bottom: 2rem">
                                <label for="" class="col-sm-4 col-form-label allFontByCustomerEdit">Select Priority</label>

                                <select class="form-control-sm pull-right" id="prio">  </select>

                            </div>
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="issue">Issue<span class="text-danger">*</span></label>
                        <input id="issue" type="text" name="issue" class="form-control" required autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="comment">Comment<span class="text-danger">*</span></label>
                        <textarea id="commentissue" type="text" name="comment" class="form-control" required autocomplete="off"></textarea>
                    </div>
                    <div class="form-group" style="padding-bottom: 2rem">
                        <label for="" class="col-sm-4 col-form-label allFontByCustomerEdit">Assign To</label>
                        <div class="col-sm-6">
                            <select class="form-control-sm pull-right" id="assign">  </select>
                        </div>
                    </div>


                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtn" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtn" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>



        <!--formSection-acknowledgment-pending-->
        <div class="" id="formSectionInprogress" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Reference Number<span class="text-danger">*</span></label>
                                <input id="ref_numberq" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="ent_by">Ent By<span class="text-danger">*</span></label>
                                <input id="ent_by" type="text" name="ent_by" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="Issueq">Issue<span class="text-danger">*</span></label>
                                <input id="Issuequ" type="text" name="Issueq" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="commentq">Comment<span class="text-danger">*</span></label>
                                <textarea id="commentq" type="text" name="commentq" class="form-control" required autocomplete="off" disabled=""></textarea>
                            </div>
                        </div>


                    </div>
                    <!--                    <div class="form-group" style="padding-bottom: 2rem">
                                            <label for="acknow_status" class="col-sm-4 col-form-label allFontByCustomerEdit">Choose Next Action </label>
                                            <div class="col-sm-6">
                                                <select class="form-control-sm pull-right" id="statusque" style="width: 20rem;margin-right: 15rem;">
                                                    <option value="" disabled selected>Select Action</option>
                                                    <option value="devPen">Development Pending</option>
                                                    <option value="uns">Closed</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group" id="reason_section" style="display: none;">
                                            <label for="reason">Reject Reason<span class="text-danger">*</span></label>
                                            <textarea id="reason_textarea" name="reason" class="form-control" required></textarea>
                                        </div>-->

                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <!--<button id="saveBtnin" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>-->
                        <button id="closeBtnin" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>



        <!--Acknowledged-->
        <div class="" id="formSectionFilePending" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="card-header">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-x cls-card"></i></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberp" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namep" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productp" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountp" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>



                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="closeBtnfile" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--Exceptions-->
        <div class="" id="formSectionFileClearance" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="card-header">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-x cls-card"></i></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberc" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namec" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productc" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountc" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="ttt" style="display: flex;flex-direction: row;">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAtts" >
                                    <thead>
                                        <tr>
                                            <th>Pending Files</th>
                                            <th>Justification</th>
                                            <th>Completion Date</th>
                                            <th>Status</th>
                                            <th>Modified By</th>
                                            <th>Modified On</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <!-- Your table body content goes here -->
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>



                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">

                        <button id="closeBtnclr" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Undertaking Recommendation-->
        <div class="" id="formSectionRecommendation" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="card-header">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-x cls-card"></i></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberrec" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namerec" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productrec" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountrec" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="ttt" style="display: flex;flex-direction: row;">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAttsrec" >
                                    <thead>
                                        <tr>
                                            <th>Pending Files</th>
                                            <th>Justification</th>
                                            <th>Completion Date</th>
                                            <th>Status</th>
                                            <th>Modified By</th>
                                            <th>Modified On</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <!-- Your table body content goes here -->
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>



                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="closeBtnrec" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Undertaking Approval Pending-->
        <div class="" id="formSectionApprovalPending" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="card-header">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-x cls-card"></i></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberu" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_nameu" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productu" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountu" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Assigned To Approve<span class="text-danger">*</span></label>
                                <input id="appund" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">

                        </div>
                    </div>

                    <div class="row">

                        <div class="ttt" style="display: flex;flex-direction: row;">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAttu" >
                                    <thead>
                                        <tr>
                                            <th>Pending Files</th>
                                            <th>Justification</th>
                                            <th>Completion Date</th>
                                            <th>Status</th>
                                            <th>Modified By</th>
                                            <th>Modified On</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Your table body content goes here -->
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>


                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="closeBtnund" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--Payment Voucher Hand Over To Finance-->
        <div class="" id="formSectionPaymentVoucher" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberpay" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namepay" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productpay" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountpay" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>



                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="closeBtnpay" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Payment Voucher Hand Over To Finance(Undertaking Approval)-->
        <div class="" id="formSectionPaymentVoucherUnder" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numberppun" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_nameppun" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productppun" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountppun" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row" id="approverRow" >
                        <div class="col">
                            <div class="form-group">
                                <label for="approver">Approved By<span class="text-danger">*</span></label>
                                <input id="approvername" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">

                        </div>
                    </div>
                    <div class="row">

                        <div class="ttt" style="display: flex;flex-direction: row;">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAttpay" >
                                    <thead>
                                        <tr>
                                            <th>Pending Files</th>
                                            <th>Justification</th>
                                            <th>Completion Date</th>
                                            <th>Status</th>
                                            <th>Modified By</th>
                                            <th>Modified On</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <!-- Your table body content goes here -->
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>


                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="closeBtnppun" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Completed-->
        <div class="" id="formSectionCompleted" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numbercom" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namecom" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productcom" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountcom" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>


                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <!--<button id="saveBtncom" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>-->
                        <button id="closeBtncom" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Completed Undertaking-->
        <div class="" id="formSectionCompletedUndertaking" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Agreement Number / Vehicle Number<span class="text-danger">*</span></label>
                                <input id="ref_numbercomund" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Customer's Name<span class="text-danger">*</span></label>
                                <input id="customer_namecomund" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Product<span class="text-danger">*</span></label>
                                <input id="productcomund" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                <input id="amountcomund" type="number" name="amount" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Approved By<span class="text-danger">*</span></label>
                                <input id="approvercomund" type="text" name="approver_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">

                        </div>
                    </div>


                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <button id="saveBtncom" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>
                        <button id="closeBtncomun" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Rejected-->
        <div class="" id="formSectionRejected" style="display: none;padding-top: 1rem;">
            <div class="card" style="width: 80%;padding: 1em;">
                <div class="card-block p-b-0">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="ref_number">Reference Number<span class="text-danger">*</span></label>
                                <input id="ref_numberrej" type="text" name="ref_number" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="ent_by">Ent By<span class="text-danger">*</span></label>
                                <input id="ent_byrej" type="text" name="ent_by" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="issue">Issue<span class="text-danger">*</span></label>
                                <input id="issue_typerej" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled="">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Comment<span class="text-danger">*</span></label>
                                <textarea id="commentrej" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled=""></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="customer_name">Rejected Reason<span class="text-danger">*</span></label>
                                <textarea id="resonrej" type="text" name="customer_name" class="form-control" required autocomplete="off" disabled=""></textarea>
                            </div>
                        </div>

                    </div>


                    <div class="card-footer d-flex justify-content-end" style="background-color: white;">
                        <!--<button id="saveBtncom" class="btn btn-sm waves-effect waves-light btn-primary" style="margin-right: 10px"><i class="icon feather icon-save"></i>Save</button>-->
                        <button id="closeBtnrej" class="btn btn-sm btn-danger"><i class="icon feather icon-x-circle"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="jspf/scripts.jspf" %>
        <script type="text/javascript" src="files/js/slimselect.js"></script>
        <script type="text/javascript" src="files/js/datatables.min.js"></script>
        <script type="text/javascript" src="files/js/sweetalert2.js"></script>
        <script type="text/javascript" src="files/js/func.js"></script>
        <script type="text/javascript" src="files/js/autoNumeric.js"></script>
        <script type="text/javascript" src="files/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" src="files/js/jquery.highlight.js"></script>
        <script type="text/javascript" src="files/js/dataTables.searchHighlight.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>






            const formSection = document.getElementById('formSection');
            const tableSection = document.getElementById('tableSection');
            const closeBtn = document.getElementById('closeBtn');
            const closeBtnin = document.getElementById('closeBtnin');
            const closeBtnfile = document.getElementById('closeBtnfile');
            const closeBtnclr = document.getElementById('closeBtnclr');
            const closeBtnund = document.getElementById('closeBtnund');
            const closeBtnpay = document.getElementById('closeBtnpay');
            const closeBtnppun = document.getElementById('closeBtnppun');
            const closeBtncom = document.getElementById('closeBtncom');
            const closeBtncomun = document.getElementById('closeBtncomun');
            const closeBtnrej = document.getElementById('closeBtnrej');
            const closeBtnrec = document.getElementById('closeBtnrec');

            closeBtn.addEventListener('click', function () {
                formSection.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnin.addEventListener('click', function () {
                formSectionInprogress.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnfile.addEventListener('click', function () {
                formSectionFilePending.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnclr.addEventListener('click', function () {
                formSectionFileClearance.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnund.addEventListener('click', function () {
                formSectionApprovalPending.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnpay.addEventListener('click', function () {
                formSectionPaymentVoucher.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnppun.addEventListener('click', function () {
                formSectionPaymentVoucherUnder.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtncom.addEventListener('click', function () {
                formSectionCompleted.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtncomun.addEventListener('click', function () {
                formSectionCompletedUndertaking.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnrej.addEventListener('click', function () {
                formSectionRejected.style.display = 'none';
                tableSection.style.display = 'block';
            });
            closeBtnrec.addEventListener('click', function () {
                formSectionRecommendation.style.display = 'none';
                tableSection.style.display = 'block';
            });



            $(document).ready(function () {
                // Show/hide tables based on active tab
                $('#myTab a').on('shown.bs.tab', function (e) {
                    var target = $(e.target).attr("href"); // activated tab
                    if (target === "#first") {
                        $('#table_card_first').show();
                        $('#table_card_second').hide();
                    } else if (target === "#second") {
                        $('#table_card_first').hide();
                        $('#table_card_second').show();
                    }
                });
            });

        </script>


        <script>
            var assign = new SlimSelect(
                    {select: '#assign',
                        placeholder: "Assign To",
                        ajax: function (search, callback) {
                            fetch('issue/assignto', {
                                method: 'POST',
                                body: new URLSearchParams({search: search || ''})
                            }).then(res => res.json()).then((data) => {
                                callback(data);
                            });
                        },
                        allowDeselect: true,
                        deselectLabel: '<span class="red">✖</span>'
                    });
            var prio = new SlimSelect(
                    {select: '#prio',
                        placeholder: "Priority",
                        ajax: function (search, callback) {
                            fetch('issue/priority', {
                                method: 'POST',
                                body: new URLSearchParams({search: search || ''})
                            }).then(res => res.json()).then((data) => {
                                callback(data);
                            });
                        },
                        allowDeselect: true,
                        deselectLabel: '<span class="red">✖</span>'
                    });
            var typeIssue = new SlimSelect(
                    {select: '#typeIssue',
                        placeholder: "Issue Type",
                        ajax: function (search, callback) {
                            fetch('type/type-select', {
                                method: 'POST',
                                body: new URLSearchParams({search: search || ''})
                            }).then(res => res.json()).then((data) => {
                                callback(data);
                            });
                        },
                        allowDeselect: true,
                        deselectLabel: '<span class="red">✖</span>'
                    });


            $('#addFmrBtn').click(function () {
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
                $('#formSection').find('input[type!=search]').val('');
                $('#formSection').find('input[type!=search]').val('');
                $('#formSection').find('select').each(function () {
                    if ($(this).data('select')) {
                        if ($(this).data('select').ajax) {
                            $(this).data('select').data.data = [];
                        }
                        $(this).data('select').set('');
                    }
                });
            }
        </script>


        <script>
            $('#saveBtn').click(function () {
                return fetch('issue/save', {
                    method: 'POST',
                    body: new URLSearchParams({
                        id: $('#saveBtn').data('id'),
                        issue_type: document.getElementById('issue').value,
                        priority: document.getElementById('prio').value,
                        comment: document.getElementById('commentissue').value,
                        assign: document.getElementById('assign').value,
                        type: document.getElementById('typeIssue').value,
                    })
                }).then(response => {
                    if (!response.ok) {
                        throw new Error(response.statusText);
                    } else {
                        Swal.fire('Successful!', 'Issue has been successfully saved');
                        clearForm();
                        $('#formSection').hide();
                        $('#tableSection').fadeIn();
                        dtable.ajax.reload();
                    }
                    return response.json();
                });
            });

        </script>







        <!--Table Details-->
        <script>




            $('#allcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                stage = 'all';
                dtable.ajax.reload();
            });
            $('#quecrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                stage = 'queue';
                dtable.ajax.reload();
            });
            $('#devcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                stage = 'develop';
                dtable.ajax.reload();
            });
            $('#testcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                stage = 'testing';
                dtable.ajax.reload();
            });
            $('#approvecrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                stage = 'approve';
                dtable.ajax.reload();
            });
            $('#cmplcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                stage = 'completed';
                dtable.ajax.reload();
            });
            $('#rejcrd').click(function () {
                document.getElementById('tableCard').style.display = 'block';
                stage = 'unsucces';
                dtable.ajax.reload();
            });

            $('#tab1-tab').click(function () {
                stage1 = 'payment';
                dtable2.ajax.reload();
            });

            let stage = 'all';


            $.fn.dataTable.ext.errMode = 'none';
            var dtable = $('#issue_table').DataTable({
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
                    "url": "issue/issuetable-all",
                    "contentType": "application/json",
                    "type": "POST",
                    "data": function (d) {
                        d.data = stage;
                        return JSON.stringify(d);
                    },
                    error: function (xhr, error, code) {
                        console.log(xhr);
                        console.log(code);
                    }
                },
                "columns": [
                    {"data": "id", className: "text-right", "visible": false},
                    {"data": "ref_number"},
                    {"data": "type"},
                    {"data": "issue_type"},
                    {"data": "priority"},
                    {"data": "ent_on"},
                    {"data": "status"}
                ],
                "language": {
                    'loadingRecords': '&nbsp;',
                    'processing': '<div class="loader2"></div>'
                },
                "createdRow": function (row, data) {
                    let action_td = document.createElement('td');
                    $(action_td).addClass('text-center');

                    $(action_td).append('<a href="javascript:void(0)" id="update" class="editrec"><i class="icon feather icon-eye f-w-600 f-16 m-r-10 text-c-green"></i></a>');

                    $(row).append(action_td);
                    $(row).data('id', data['id']);
                    $(row).data('status', data['status']);

                    // Color the text and make it bold in the priority column based on its value
                    if (data['priority'] === 'Urgent') {
                        $('td', row).eq(3).css({
                            'color': 'red',
                            'font-weight': 'bold'
                        });
                    } else {
                        $('td', row).eq(3).css({
                            'color': '#e0da16',
                            'font-weight': 'bold'
                        });
                    }
                }
            });




        </script>


        <!--editrec-->
        <script>
            $(document).on('click', '.editrec', function () {
                let row = $(this).closest('tr');
                let status = row.data('status');
                if (status === 'Queue') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');
                    fetch('issue/details-all/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let d2 = data.d2;
                                let obj = data.obj;

                                $('#ref_numberq').val(obj.ref_number);
                                $('#Issuequ').val(obj.issue_type);
                                $('#commentq').val(obj.comment);
                                //                                $('#productack').val(d1.product_txt);
                                //                                console.log(d1.issue);
                                console.log(obj.issue_type);
                                $('#ent_by').val(d2.entered);
                                $('#saveBtnin').data('mode', 'update');
                                $('#saveBtnin').data('id', id);
                                $('#saveBtnin').html('<i class="icon feather icon-save"></i>Update');
                                $('#formSectionInprogress').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));
                            });
                } else if (status === 'Development Pending') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');
                    fetch('issue/details-file/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                $('#ref_numberp').val(data.ref_number);
                                $('#customer_namep').val(data.customer_name);
                                $('#amountp').val(data.amount);
                                $('#productp').val(data.productTxt);
                                $('#saveBtnfile').data('mode', 'update-filepending');
                                $('#saveBtnfile').data('id', id);
                                $('#saveBtnfile').html('<i class="icon feather icon-save"></i>Update');
                                $('#formSectionFilePending').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));
                            });
                } else if (status === 'Exceptions') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');

                    // Fetch team and attachment details
                    fetch('issue/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let content = resp.data.content;
                                let product = resp.data.productData;

                                $('#ref_numberc').val(content.ref_number);
                                $('#customer_namec').val(content.customer_name);
                                $('#amountc').val(content.amount);
                                $('#productc').val(product.product_txt);
                                console.log(data.product_txt);
                                let attachments = resp.data.videos;

                                // Clear existing rows in the attachment table
                                $('#tbladdAtts tbody').empty();

                                // Populate the attachment table with fetched data
                                attachments.forEach((attachment) => {
                                    // Get the table body
                                    var tableBody = document.querySelector('#tbladdAtts tbody');

                                    // Create a new row
                                    var newRow = tableBody.insertRow();

                                    // Create cells in the new row
                                    var fileNameCell = newRow.insertCell(0);
                                    var justificationCell = newRow.insertCell(1);
                                    var dateCell = newRow.insertCell(2);
                                    var statusCell = newRow.insertCell(3);
                                    var modifiedByCell = newRow.insertCell(4);
                                    var modifiedOnCell = newRow.insertCell(5);


                                    // Set the text content of the cells with the fetched values
                                    fileNameCell.textContent = attachment.name;
                                    statusCell.textContent = attachment.status; // Assuming status is available in attachment object
                                    modifiedByCell.textContent = attachment.modby; // Assuming modifiedBy is available in attachment object
                                    modifiedOnCell.textContent = attachment.mod_on; // Assuming modifiedOn is available in attachment object
                                    justificationCell.textContent = attachment.justification; // Assuming modifiedOn is available in attachment object
                                    dateCell.textContent = attachment.date; // Assuming modifiedOn is available in attachment object


                                });


                                // Show the form section
                                $('#saveBtnclr').data('mode', 'update-fileclear');
                                $('#saveBtnclr').data('id', id);
                                $('#saveBtnclr').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionFileClearance').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));

                            });
                } else if (status === 'Undertaking Recommendation') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');

                    // Fetch team and attachment details
                    fetch('issue/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let content = resp.data.content;
                                let product = resp.data.productData;

                                $('#ref_numberrec').val(content.ref_number);
                                $('#customer_namerec').val(content.customer_name);
                                $('#amountrec').val(content.amount);
                                $('#productrec').val(product.product_txt);
                                console.log(data.product_txt);
                                let attachments = resp.data.videos;

                                // Clear existing rows in the attachment table
                                $('#tbladdAttsrec tbody').empty();

                                // Populate the attachment table with fetched data
                                attachments.forEach((attachment) => {
                                    // Get the table body
                                    var tableBody = document.querySelector('#tbladdAttsrec tbody');

                                    // Create a new row
                                    var newRow = tableBody.insertRow();

                                    // Create cells in the new row
                                    var fileNameCell = newRow.insertCell(0);
                                    var justificationCell = newRow.insertCell(1);
                                    var dateCell = newRow.insertCell(2);
                                    var statusCell = newRow.insertCell(3);
                                    var modifiedByCell = newRow.insertCell(4);
                                    var modifiedOnCell = newRow.insertCell(5);


                                    // Set the text content of the cells with the fetched values
                                    fileNameCell.textContent = attachment.name;
                                    statusCell.textContent = attachment.status; // Assuming status is available in attachment object
                                    modifiedByCell.textContent = attachment.modby; // Assuming modifiedBy is available in attachment object
                                    modifiedOnCell.textContent = attachment.mod_on; // Assuming modifiedOn is available in attachment object
                                    justificationCell.textContent = attachment.justification; // Assuming modifiedOn is available in attachment object
                                    dateCell.textContent = attachment.date;

                                });


                                // Show the form section
                                $('#saveBtnrec').data('mode', 'update-Recommendation');
                                $('#saveBtnrec').data('id', id);
                                $('#saveBtnrec').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionRecommendation').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));

                            });
                } else if (status === 'Undertaking Approval Pending') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');


                    fetch('issue/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let content = resp.data.content;
                                let product = resp.data.productData;
                                let approve = resp.data.approverData;

                                $('#ref_numberu').val(content.ref_number);
                                $('#customer_nameu').val(content.customer_name);
                                $('#amountu').val(content.amount);
                                $('#productu').val(product.product_txt);
                                $('#appund').val(approve.approvername);
                                let attachments = resp.data.videos;

                                // Clear existing rows in the attachment table
                                $('#tbladdAttu tbody').empty();

                                // Populate the attachment table with fetched data
                                attachments.forEach((attachment) => {
                                    // Get the table body
                                    var tableBody = document.querySelector('#tbladdAttu tbody');

                                    // Create a new row
                                    var newRow = tableBody.insertRow();

                                    // Create cells in the new row
                                    var fileNameCell = newRow.insertCell(0);
                                    var justificationCell = newRow.insertCell(1);
                                    var dateCell = newRow.insertCell(2);
                                    var statusCell = newRow.insertCell(3);
                                    var modifiedByCell = newRow.insertCell(4);
                                    var modifiedOnCell = newRow.insertCell(5);


                                    // Set the text content of the cells with the fetched values
                                    fileNameCell.textContent = attachment.name;
                                    statusCell.textContent = attachment.status; // Assuming status is available in attachment object
                                    modifiedByCell.textContent = attachment.modby; // Assuming modifiedBy is available in attachment object
                                    modifiedOnCell.textContent = attachment.mod_on; // Assuming modifiedOn is available in attachment object
                                    justificationCell.textContent = attachment.justification; // Assuming modifiedOn is available in attachment object
                                    dateCell.textContent = attachment.date;


                                });

                                // Show the form section
                                $('#saveBtnund').data('mode', 'update-undertaking');
                                $('#saveBtnund').data('id', id);
                                $('#saveBtnund').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionApprovalPending').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));

                            });
                } else if (status === 'Payment Voucher Hand Over To Finance') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');
                    fetch('issue/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let content = resp.data.content;
                                let product = resp.data.productData;

                                $('#ref_numberpay').val(content.ref_number);
                                $('#customer_namepay').val(content.customer_name);
                                $('#amountpay').val(content.amount);
                                $('#productpay').val(product.product_txt);
                                $('#saveBtnpay').data('mode', 'update-payment');
                                $('#saveBtnpay').data('id', id);
                                $('#saveBtnpay').html('<i class="icon feather icon-save"></i>Update');
                                $('#formSectionPaymentVoucher').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));
                            });
                } else if (status === 'Payment Voucher Hand Over To Finance(Undertaking Approval)') {
                    loadDiv($('#tableSection'));
                    let id = $(this).parents('tr').data('id');
                    fetch('issue/clearance-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {

                                let data = resp.data;
                                let content = resp.data.content;
                                let approve = resp.data.approverData;
                                let product = resp.data.productData;


                                $('#ref_numberppun').val(content.ref_number);
                                $('#customer_nameppun').val(content.customer_name);
                                $('#amountppun').val(content.amount);
                                $('#productppun').val(product.product_txt);
                                $('#approvername').val(approve.approvername);


                                let attachments = resp.data.videos;

                                // Clear existing rows in the attachment table
                                $('#tbladdAttpay tbody').empty();

                                // Populate the attachment table with fetched data
                                attachments.forEach((attachment) => {
                                    // Get the table body
                                    var tableBody = document.querySelector('#tbladdAttpay tbody');

                                    // Create a new row
                                    var newRow = tableBody.insertRow();

                                    // Create cells in the new row
                                    var fileNameCell = newRow.insertCell(0);
                                    var justificationCell = newRow.insertCell(1);
                                    var dateCell = newRow.insertCell(2);
                                    var statusCell = newRow.insertCell(3);
                                    var modifiedByCell = newRow.insertCell(4);
                                    var modifiedOnCell = newRow.insertCell(5);


                                    // Set the text content of the cells with the fetched values
                                    fileNameCell.textContent = attachment.name;
                                    statusCell.textContent = attachment.status; // Assuming status is available in attachment object
                                    modifiedByCell.textContent = attachment.modby; // Assuming modifiedBy is available in attachment object
                                    modifiedOnCell.textContent = attachment.mod_on; // Assuming modifiedOn is available in attachment object
                                    justificationCell.textContent = attachment.justification; // Assuming modifiedOn is available in attachment object
                                    dateCell.textContent = attachment.date; // Assuming modifiedOn is available in attachment object


                                });

                                $('#saveBtnppun').data('mode', 'update-payunder');
                                $('#saveBtnppun').data('id', id);
                                $('#saveBtnppun').html('<i class="icon feather icon-save"></i>Update');
                                $('#formSectionPaymentVoucherUnder').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));
                            });
                } else if (status === 'Completed') {
                    loadDiv($('#tableSection'));

                    let id = $(this).parents('tr').data('id');
                    fetch('issue/paymentv-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let d1 = data.d1;
                                let obj = data.obj;


                                $('#ref_numbercom').val(obj.ref_number);
                                $('#customer_namecom').val(obj.customer_name);
                                $('#amountcom').val(obj.amount);
                                $('#productcom').val(d1.product_txt);
                                $('#saveBtnpv').data('mode', 'update-completed');
                                $('#saveBtnpv').data('id', id);
                                $('#saveBtnpv').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionCompleted').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));


                            })
                            .catch(error => {
                                // Handle fetch error
                                console.error('Error fetching payment details:', error);
                            });
                } else if (status === 'Completed(Undertaking Approval)') {
                    loadDiv($('#tableSection'));

                    let id = $(this).parents('tr').data('id');
                    fetch('issue/paymentv-details/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let d1 = data.d1;
                                let d2 = data.d2;
                                let obj = data.obj;


                                $('#ref_numbercomund').val(obj.ref_number);
                                $('#customer_namecomund').val(obj.customer_name);
                                $('#amountcomund').val(obj.amount);
                                $('#productcomund').val(d1.product_txt);
                                $('#approvercomund').val(d2.approvername);
                                $('#saveBtnpv').data('mode', 'update-completed');
                                $('#saveBtnpv').data('id', id);
                                $('#saveBtnpv').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionCompletedUndertaking').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));


                            })
                            .catch(error => {
                                // Handle fetch error
                                console.error('Error fetching payment details:', error);
                            });
                } else if (status === 'Unsuccessful') {
                    loadDiv($('#tableSection'));


                    let id = $(this).parents('tr').data('id');
                    fetch('issue/details-all/' + id)
                            .then(resp => resp.json())
                            .then((resp) => {
                                let data = resp.data;
                                let d2 = data.d2;
                                let obj = data.obj;


                                $('#ref_numberrej').val(obj.ref_number);
                                $('#ent_byrej').val(d2.entered);
                                $('#issue_typerej').val(obj.issue_type);
                                $('#commentrej').val(obj.comment);
                                $('#resonrej').val(obj.reason);
                                $('#saveBtnpv').data('mode', 'update-completed');
                                $('#saveBtnpv').data('id', id);
                                $('#saveBtnpv').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                                $('#formSectionRejected').fadeIn();
                                $('#tableSection').hide();
                                finishLoadDiv($('#tableSection'));


                            })
                            .catch(error => {
                                // Handle fetch error
                                console.error('Error fetching payment details:', error);
                            });
                }

            });
        </script>

        <!--        <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var ImsStatusSelect = document.getElementById("statusque");
                        var commentSection = document.getElementById("reason_section");

                        // Add event listener to the select element
                        ImsStatusSelect.addEventListener("change", function () {

                            // Check if the selected value is "reject"
                            if (this.value === "uns") {
                                // Show the comment section
                                commentSection.style.display = "block";
                            } else {
                                // Hide the comment section
                                commentSection.style.display = "none";
                            }
                        });

                    });

                    $('#saveBtnin').click(function () {
                        // Get the value of the facility status select element
                        var statusque = document.getElementById('statusque').value;

                        // Initialize request body
                        var requestBody = {
                            id: $('#saveBtnin').data('id'),
                            statusque: statusque,
                        };

                        // Check if the facility status is "reject"
                        if (statusque === "uns") {
                            // Include comment in the request body
                            requestBody.reason = document.getElementById('reason_textarea').value;
                        }

                        // Send the request
                        return fetch((($('#saveBtnin').data('mode') === 'save') ? 'issue/save' : 'issue/update-ack'), {
                            method: 'POST',
                            body: new URLSearchParams(requestBody)
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            } else {
                                Swal.fire('Successfull!', 'FMR has been successfully saved');
                                clearForm();
                                $('#formSectionInprogress').hide();
                                $('#tableSection').fadeIn();
                                dtable.ajax.reload();
                            }
                            return response.json();
                        });
                    });
                </script>-->

    </body>
</html>
