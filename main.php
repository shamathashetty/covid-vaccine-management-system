<?php
$url='photo.jpg';
?>


<html lang="en">
<head>
    <title>meow</title>
<style type="text/css">
   body{
		background-image: url('photo1.jpg');
		background-repeat: no-repeat;
		background-size: cover;
       }
	input{
		width:40%
		height:5%;
		border: 2px solid;
		border-radius: 05px;
		padding: 10px 15px 10px 15px;
		margin:auto;
		box-shadow:1px 1px 2px 1px purple;


	}

	table, th, td {
    
    padding: 25px;
    text-align: left;
    color:blue;
    border: 1px solid;
    border-color:blue;
    font-size: large;

  }
  </style>
</head>
<body>
	<center>
	<h1>COVID VACCINE MANAGEMENT SYSTEM</h1>
		<form action="" method="POST">
			<br/><input type="text" name="hid" placeholder="ENTER HOSPITAL ID TO SEARCH "/><br/>
			<br/><input type="submit" name="search" value="search">
		</form>
	</center>
</body>
<?php

$connection=mysqli_connect("localhost","root","");
$db=mysqli_select_db($connection,'covid_vaccine');
if(isset($_POST['search'])){?>
<table class="table table-bordered table-hover">
                <thead>
                   <th>HOSPITAL NAME</th>
                        <th>PERSON NAME</th>
                        <th>PERSON EMAIL</th>
                        <th>PERSON AGE</th>
                        <th>PERSON PHONE NUMBER</th>
						<th>PERSON ADDRESS</address></th>
                </thead>
                <tbody>

	<?php
	$id=$_POST['hid'];
	$query="SELECT Hospital.H_id,Hospital.H_name , Person.P_name,Person.P_email,Person.P_age,Person.P_contactno,Person.P_address
	from Hospital,Person where Person.H_id ='$id' AND Hospital.H_id = '$id' ";
	$query_run = mysqli_query($connection, $query);
 	if($query_run = mysqli_query($connection, $query)){
                        if($query_run->num_rows > 0){
	while($row = $query_run->fetch_object())
	{


		?>

			

				<tr>
					<td><?php echo $row->H_name?></td>
					<td><?php echo $row->P_name ?></td>
					<td><?php echo $row->P_email ?></td>
					<td><?php echo $row->P_age ?></td>
					<td><?php echo $row->P_contactno ?></td>	
					<td><?php echo $row->P_address ?></td>
				</tr>
				
		<?php
	}
}
}
}
?>