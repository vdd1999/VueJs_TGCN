<?php
	define('servername','localhost');
	define('username','root');
	define('password','root');
	define('db','tgcn');
	function open_db() {
		$conn = new mysqli(servername, username, password, db);
		
		if ($conn->connect_error) {
			die($conn->connect_error);
		}
		return $conn;
	}
	function login ($user, $pass) {
		$sql = "select * from account where username = ?";
		$conn = open_db();
		$stm =$conn->prepare($sql);
		$stm->bind_param('s', $user);
		if (!$stm -> execute()) {
			return array('code' => 1,'error'=>'Cannot execute command');
		}

		$result = $stm->get_result();

		if ($result->num_rows == 0) {
			return array('code' => 1,'error'=>'Account does not exist');
		}
		$data = $result->fetch_assoc();
		$hash_pass = $data['password'];
		if (!password_verify($pass, $hash_pass)) {
			return array('code' => 2,'error'=>'Invalid Password');
		}
		else if ($data['activated'] == 0){
			return array('code' => 3,'error'=>'Account does not activate','data'=>$data);
		}
		else return array('code' => 0,'data'=>$data);


	}

	function isExist_email($email) {
		$sql = 'select username from account where email = ?';
		$conn = open_db();
		$stm =$conn->prepare($sql);
		$stm->bind_param('s',$email);
		if (!$stm -> execute()) {
			die('Querry error: '.$stm->error);
		}
		$result = $stm->get_result();
		if ($result->num_rows > 0) {
			return true; //có email
		}else {
			return false;
		}
	}
	function register ($user, $pass, $first, $last, $email) {
		if (isExist_email($email)) {
			return array('code' => 1,'error'=>'Email exist');
		}
		$rand = random_int(0,1000);
		$hash = password_hash($pass, PASSWORD_DEFAULT);
		$token = md5($user.'+'.$rand);
		$sql = "insert into account(username, firstname, lastname, email, password, activate_token) values(?,?,?,?,?,?)";
		$conn = open_db();
		$stm =$conn->prepare($sql);
		$stm->bind_param('ssssss',$user, $first, $last, $email,$hash,$token);
		if (!$stm->execute()) {
			return array('code' => 2,'error' => 'Cannot execute command');
		}
		else {
			return array('code' => 0);
		}
	}
	
	function add_product($name, $price, $desc) {

	}

	function get_all_product() {
		$sql = 'select * from product';
		$conn = open_db();
		$stm =$conn->query($sql);
		$data = $stm->get_result();
		$result = $data->fetch_assoc();
		print_r($result);
	}

?>