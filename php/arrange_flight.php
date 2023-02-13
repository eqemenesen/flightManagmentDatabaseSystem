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
  select {
  width: 100%;
  height: 35px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 0 10px;
  color: #fff;
  background-color: #333;
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
  /* Set the background color to black and the text color to white */
  body {
    background-color: #222;
    color: #fff;
  }
</style>
</head>
<body>
  <h1 style='text-align: center;'>ARRANGE FLIGHT</h1>
  <form action="arrange_flight.php" method="post">
    <!-- Dropdown menu to select a plane -->
    <label for="tailID">Select a plane:</label>
    <select name="tailID" id="tailID">
      <option value="">-- Select a plane --</option>
      <?php
      // Connect to MySQL database
      include "config.php";

      // Retrieve all rows from the goesTo table
      $sql_statement = "SELECT * FROM goesTo ORDER BY tailID";
      $result = mysqli_query($db, $sql_statement);

      // Generate <option> elements for each row
      while ($row = mysqli_fetch_assoc($result)) {
        $tailID = $row['tailID'];
        echo "<option value='$tailID'>$tailID</option>";
      }
      ?>
    </select>

    <!-- Dropdown menus to select two pilots -->
    <label for="pilot1">Select a pilot:</label>
    <select name="pilot1" id="pilot1">
      <option value="">-- Select a pilot --</option>
      <?php
      // Connect to MySQL database (if not already connected)
      include "config.php";

      // Retrieve all rows from the pilots table
      $sql_statement = "SELECT * FROM pilots ORDER BY pilLicense";
      $result = mysqli_query($db, $sql_statement);

      // Generate <option> elements for each row
      while ($row = mysqli_fetch_assoc($result)) {
            $pilLicense = $row['pilLicense'];
            echo "<option value='$pilLicense'>$pilLicense</option>";
      }
      ?>
    </select>

<label for="pilot2">Select a pilot:</label>
<select name="pilot2" id="pilot2">
  <option value="">-- Select a pilot --</option>
  <?php
  // Connect to MySQL database (if not already connected)
  include "config.php";

  // Retrieve all rows from the pilots table
  $sql_statement = "SELECT * FROM pilots ORDER BY pilLicense";
  $result = mysqli_query($db, $sql_statement);

  // Generate <option> elements for each row
  while ($row = mysqli_fetch_assoc($result)) {
    $pilLicense = $row['pilLicense'];
    echo "<option value='$pilLicense'>$pilLicense</option>";
  }
  ?>
</select>

          <!-- Dropdown menus to select three cabin crew members -->
    <label for="cabin_crew1">Select a cabin crew member:</label>
    <select name="cabin_crew1" id="cabin_crew1">
      <option value="">-- Select a cabin crew member --</option>
      <?php
      // Connect to MySQL database (if not already connected)
      include "config.php";

      // Retrieve all rows from the cabincrew table
      $sql_statement = "SELECT * FROM cabincrew ORDER BY crewID";
      $result = mysqli_query($db, $sql_statement);

      // Generate <option> elements for each row
      while ($row = mysqli_fetch_assoc($result)) {
        $crewID = $row['crewID'];
        echo "<option value='$crewID'>$crewID</option>";
      }
      ?>
    </select>
    <label for="cabin_crew2">Select a cabin crew member:</label>
    <select name="cabin_crew2" id="cabin_crew2">
      <option value="">-- Select a cabin crew member --</option>
      <?php
      // Connect to MySQL database (if not already connected)
      include "config.php";

      // Retrieve all rows from the cabincrew table
      $sql_statement = "SELECT * FROM cabincrew ORDER BY crewID";
      $result = mysqli_query($db, $sql_statement);

      // Generate <option> elements for each row
      while ($row = mysqli_fetch_assoc($result)) {
        $crewID = $row['crewID'];
        echo "<option value='$crewID'>$crewID</option>";
      }
      ?>
    </select>
    <label for="cabin_crew3">Select a cabin crew member:</label>
    <select name="cabin_crew3" id="cabin_crew3">
      <option value="">-- Select a cabin crew member --</option>
      <?php
      // Connect to MySQL database (if not already connected)
      include "config.php";

      // Retrieve all rows from the cabincrew table
      $sql_statement = "SELECT * FROM cabincrew ORDER BY crewID";
      $result = mysqli_query($db, $sql_statement);

      // Generate <option> elements for each row
      while ($row = mysqli_fetch_assoc($result)) {
        $crewID = $row['crewID'];
        echo "<option value='$crewID'>$crewID</option>";
      }
      ?>
    </select>

    <!-- Submit button to insert selected values into the database -->
    <button type="submit">Insert into flight</button>
  </form>
  <?php

// Connect to MySQL database
include "config.php";

// Check if the form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  // Get the form data
  $tailID = mysqli_real_escape_string($db, $_POST['tailID']);
  $pilot1 = mysqli_real_escape_string($db, $_POST['pilot1']);
  $pilot2 = mysqli_real_escape_string($db, $_POST['pilot2']);
  $cabin_crew1 = mysqli_real_escape_string($db, $_POST['cabin_crew1']);
  $cabin_crew2 = mysqli_real_escape_string($db, $_POST['cabin_crew2']);
  $cabin_crew3 = mysqli_real_escape_string($db, $_POST['cabin_crew3']);

  // Insert the pilots into the flies table
  $sql = "INSERT INTO flies (pilLicense, tailID) VALUES ('$pilot1', '$tailID'), ('$pilot2', '$tailID')";
  mysqli_query($db, $sql);

  // Insert the cabin crew members into the manages table
  $sql = "INSERT INTO manages (tailID, crewID) VALUES ('$tailID', '$cabin_crew1'), ('$tailID', '$cabin_crew2'), ('$tailID', '$cabin_crew3')";
  mysqli_query($db, $sql);
}

?>

</body>
</html>




