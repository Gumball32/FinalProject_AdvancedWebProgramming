<?php

class ReservationsController extends Controller {
    // properties

    // constructor
    public function __construct()
    {
        parent::__construct();
    }

    // controller methods
    public function getRess() {

        $stmt = $this->conn->query("SELECT * FROM reservations");
        $results = $stmt->fetch_all(MYSQLI_ASSOC);
        var_dump($results);
        // include "views/create_resesrvation.php";
    }

    public function getRes($id) {
        $resObj = new Reservation($this->conn);
        if($resObj->fetchRes($id)->success()) {
            $res = $resObj->getRes();
            echo "great";
            // include "views/single_post.php";
        } 
        else {
            include "views/_404.php";
        }
    }

    public function newReservation($id) {
        $resObj = new Reservation($this->conn);
        
        if($resObj->checkReservation($id)->success()) {        
            include "views/create_reservation.php";
        }
        else {
            echo "this room is not available";
        }
    }

    public function newReservation_get() {
        include "views/create_reservation.php";
    }
    public function create() {
        $resObj = new Reservation($this->conn);
        if($resObj->validateRes($this->req)->success()) {
            if($resObj->createNewRes()->success()) {
                Router::redirect("reservations/get/" . $resObj->res_id);
            }
        } else {
            $errors = $resObj->errors;
            Messenger::setMsg(strval("Failed to create a reservation! " . $errors["fetch_err"]), "danger");    
            include "views/create_reservation.php";
        }
    }
}