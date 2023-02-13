<!DOCTYPE html>
<html>
<head>
<style>
  /* Add some styling to make the form look nice */
  form {
    width: 500px;
    margin: 0 auto;
  }
  label {
    display: block;
    margin-bottom: 5px;
  }
  input[type="text"] {
    width: 100%;
    height: 35px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 0 10px;
  }
  select {
    width: 100%;
    height: 35px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 0 10px;
  }
  button {
    width: 100%;
    height: 35px;
    font-size: 14px;
    background-color: #00bfff;
    color: #fff;
    border: 0;
    border-radius: 4px;
    cursor: pointer;
  }
</style>
</head>
<body>
  <h1 style='text-align: center;'>ADD PASSENGER</h1>
  <!DOCTYPE html>
<html>
<head>
<style>
  /* Add some styling to make the form look nice */
  form {
    width: 500px;
    margin: 0 auto;
  }
  label {
    display: block;
    margin-bottom: 5px;
  }
  input[type="text"] {
    width: 100%;
    height: 35px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 0 10px;
  }
  select {
    width: 100%;
    height: 35px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 0 10px;
  }
  button {
    width: 100%;
    height: 35px;
    font-size: 14px;
    background-color: #00bfff;
    color: #fff;
    border: 0;
    border-radius: 4px;
    cursor: pointer;
  }
</style>
</head>
<body>
  <h1 style='text-align: center;'>ADD PASSENGER</h1>
  <form action="add_passenger.php" method="post">
    <!-- Text input for name -->
    <label for="name">Name:</label>
    <input type="text" name="name" id="name">

    <!-- Text input for surname -->
    <label for="surname">Surname:</label>
    <input type="text" name="surname" id="surname">

    <!-- Text input for ID number -->
    <label for="id_number">ID number:</label>
    <input type="text" name="id_number" id="id_number">

    <!-- Select a flight -->
    <label for="flight">Select a flight:</label>
    <select name="flight" id="flight">
      <option value="">-- Select a flight --</option>
      <?php
      // Connect to MySQL database
      include "config.php";

      // Retrieve all rows from the goesTo table
      $sql_statement = "SELECT * FROM goesTo INNER JOIN planes ON goesTo.tailID=planes.tailID INNER JOIN airports ON goesTo.portID=airports.portID ORDER BY tailID";
      $result = mysqli_query($db, $sql_statement);

      // Generate <option> elements for each row
      while ($row = mysqli_fetch_assoc($result)) {
        $tailID = $row['tailID'];
        $plAirway = $row['plAirway'];
        $portName = $row['portName'];
        $portCity = $row['portCity'];
        $flDate = $row['flDate'];
        $flTime = $row['flTime'];
        echo "<option value='$tailID'>$plAirway - $tailID - $portName - $portCity - $flDate - $flTime</option>";
      }
     
        // Generate a random ticket number
        $ticketNum = generateRandomString(9);

        // Text input for seat number
        <label for="seat_number">Seat number:</label>
        <input type="text" name="seat_number" id="seat_number">

        <button type="submit">Add passenger</button>
        </form>

    <?php
    // Function for generating a random string
    function generateRandomString($length) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
      $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
    return $randomString;
    }
    ?>
    </body>
</html>
