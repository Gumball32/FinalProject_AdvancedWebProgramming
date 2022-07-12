<?php

class Reservation {
    // properties
    public $res_id;
    public $user_id;
    public $room_id;
    public $startDay;
    public $endDay;
    public $price;
    public $total;
    public $created_at;
    public $updated_at;
    public $conn;
    public $res = [];
    public $ress = [];
    public $errors = [];

    // constructor (inject DB conn)
    public function __construct($conn) {
        $this->conn = $conn;
    }
    // Post methods
    // "setter" for the post prop
    public function fetchRes($id) {
        $this->res_id = $id;
        $sql = "SELECT reservations.*, users.name
                FROM reservations 
                JOIN users ON users.id = reservations.user_id
                WHERE reservations.id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("i", $this->res_id);
        $stmt->execute();
        $result = $stmt->get_result();
        var_dump($result);
        if($result->num_rows !== 1) {
            $this->errors['fetch_err'] = "Couldn't retrieve resource!";
        } else {
            $this->res = $result->fetch_assoc();
        }
        return $this;
    }

    public function getRes() {
        return $this->res;
    }

    public function validateRes($res) {       
        $sql = "SELECT users.*
                FROM users JOIN reservations AS res
                ON users.id = res.user_id 
                WHERE users.name = ?";
        // var_dump($res['']);
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("s", $res['name']);
        $stmt->execute();
        $results = $stmt->get_result();
        if($results->num_rows == 1) {
            // echo "hello";
            $this->errors= 0;
            $results = $results->fetch_assoc();
            var_dump($results);
            $this->user_id = $results['id'];
            $this->startDay = $res['startDate'];
            $this->endDay = $res['endDate'];
            $this->room_id = $_SESSION['room_id'];
        } else {
            $this->errors['fetch_err']= "Couldn't retrieve resource!";
        }
        return $this;
    }


    public function checkReservation($id) {
        $sql=" SELECT res.room_id
        FROM `reservations` as res
        JOIN `rooms` as r
        on res.room_id = r.id
        where res.id >= ALL(SELECT res1.id
                            FROM `reservations` as res1
                            JOIN `rooms` as r1
                            on res1.room_id = r1.id and  r1.id= 1 )
            and r.id=? and DATEDIFF(res.end_date, NOW()) <= 0
      GROUP BY res.room_id";
        
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $results = $stmt->get_result();    
        if($results->num_rows === 0) {
            $this->errors['fetch_err'] = "Couldn't retrieve resource!";
        } else {
            $this->rooms = $results->fetch_all(MYSQLI_ASSOC);
        }
        return $this;
        var_dump($this);
    }

    public function createNewRes() {
        $this->price = 2000;
        $this->total = 2000;

    
        var_dump($this);

        $sql = "INSERT INTO `reservations` (`user_id`, `room_id`, `start_date`, `end_date`, `price`, `total`)
                VALUE(?,?,?,?,?,?)";
        
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("ssssss",  $this->user_id,  $this->room_id,  $this->startDay,  $this->endDay,  $this->price, $this->total);
        
        // $this->post_img = "images/itec_blog_628df26139e79.jpeg";
        // $this->post_user_id = 1;
        // $sql = "INSERT INTO posts (title, body, user_id, post_img) 
        //         VALUES (?,?,?,?)";
        // $stmt = $this->conn->prepare($sql);
        // $stmt->bind_param("ssis", $this->post_title, $this->post_body, $this->post_user_id, $this->post_img);
        $stmt->execute();
        if($stmt->affected_rows !== 1) {
            $this->errors['insert_err'] = "Reservation was not created!";
        } else {
            $this->post_id = $stmt->insert_id;
        }
        return $this;
    }

    // success method, return T / F if $error is empty
    public function success() {
        if(empty($this->errors)) {
            return true;
        } else {
            return false;
        }
    }
}