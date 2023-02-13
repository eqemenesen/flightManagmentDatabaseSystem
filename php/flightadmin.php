<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      background-color: #222;
      color: #fff;
    }
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      text-align: left;
      padding: 8px;
    }
    tr:nth-child(even) {
      background-color: #444;
    }
  </style>
</head>
<body>
  <h1 style='text-align: center;'>DEPARTURE</h1>
  <table>
    <tr>
      <th>FLIGHT</th>
      <th>DESTINATION</th>
      <th>TIME</th>
      <th>GATE</th>
      <th>STATUS</th>
    </tr>
    <?php
    // Connect to MySQL database
    include "config.php";

    // Retrieve rows from goesTo table
    $sql_statement = "SELECT * FROM goesTo ORDER BY flDate, flTime";
    $result = mysqli_query($db, $sql_statement);

    // Retrieve rows from airports table
    $airports_sql = "SELECT * FROM airports";
    $airports_result = mysqli_query($db, $airports_sql);

    // Create array to store airport names
    $airports = array();
    while ($row = mysqli_fetch_assoc($airports_result)) {
      $airports[$row['portID']] = $row['portName'];
    }

    // Generate HTML table rows
    while ($row = mysqli_fetch_assoc($result)) {
      $tailID = $row['tailID'];
      $portID = $row['portID'];
      $flTime = $row['flTime'];
      $fgate = $row['fgate'];
      $status = $row['status'];

      // Get airport name from airports array
      $portName = $airports[$portID];

      // Generate HTML table row
      echo "<tr>";
      echo "<td>$tailID</td>";
      echo "<td>$portName</td>";
      echo "<td>$flTime</td>";
      echo "<td>$fgate</td>";
      echo "<td>
        <form method='post'>
          <!-- Add a hidden input field with the unique identifier for this row -->
          <input type='hidden' name='tailID' value='$tailID'>
          <select name='status'>
            <option value='ON TIME' <?php if ($status == 'ON TIME') echo 'selected'; ?>>ON TIME</option>
            <option value='DELAYED' <?php if ($status == 'DELAYED') echo 'selected'; ?>>DELAYED</option>
            <option value='CANCELED' <?php if ($status == 'CANCELED') echo 'selected'; ?>>CANCELED</option>
            <option value='GATE OPEN' <?php if ($status == 'GATE OPEN') echo 'selected'; ?>>GATE OPEN</option>
            <option value='BOARDING' <?php if ($status == 'BOARDING') echo 'selected'; ?>>BOARDING</option>
          </select>
          <input type='submit' value='Update'>
        </form>
        <form method='post'>
          <input type='hidden' name='tailID' value='$tailID'>
          <input type='submit' name='delete' value='Delete'>
        </form>
        
      </td>";
      echo "</tr>";

      if (isset($_POST['status'])) {
        $status = $_POST['status'];
        $tailID = $_POST['tailID'];
        $update_sql = "UPDATE goesTo SET status = '$status' WHERE tailID = '$tailID'";
        mysqli_query($db, $update_sql);
      }
      if (isset($_POST['delete'])) {
        $tailID = $_POST['tailID'];
        $delete_sql = "DELETE FROM goesTo WHERE tailID = '$tailID'";
        mysqli_query($db, $delete_sql);
        $delete_flies_sql = "DELETE FROM flies WHERE tailID = '$tailID'";
        mysqli_query($db, $delete_flies_sql);
        $delete_manages_sql = "DELETE FROM manages WHERE tailID = '$tailID'";
        mysqli_query($db, $delete_manages_sql);
      
        // Retrieve ticket numbers with the specified tailID
        $ticket_numbers_sql = "SELECT ticketNum FROM seats WHERE tailID = '$tailID'";
        $ticket_numbers_result = mysqli_query($db, $ticket_numbers_sql);
      
        while ($row = mysqli_fetch_assoc($ticket_numbers_result)) {
          $ticketNum = $row['ticketNum'];
      
          // Delete rows with the ticket number from the belongsTo table
          $delete_belongsTo_sql = "DELETE FROM belongsTo WHERE ticketNum = '$ticketNum'";
          mysqli_query($db, $delete_belongsTo_sql);
      
          // Retrieve luggage IDs with the ticket number
          $lugID_sql = "SELECT lugID FROM belongsTo WHERE ticketNum = '$ticketNum'";
          $lugID_result = mysqli_query($db, $lugID_sql);
      
          while ($row = mysqli_fetch_assoc($lugID_result)) {
            $lugID = $row['lugID'];
      
            // Delete rows with the luggage ID from the luggage table
            $delete_luggage_sql = "DELETE FROM `luggage` WHERE lugID = '$lugID'";
            mysqli_query($db, $delete_luggage_sql);
          }
      
          // Delete rows with the ticket number from the passengers table
          $delete_passengers_sql = "DELETE FROM passengers WHERE ticketNum = '$ticketNum'";
          mysqli_query($db, $delete_passengers_sql);
      
          // Delete rows with the ticket number from the seats table
          $delete_seats_sql = "DELETE FROM seats WHERE ticketNum = '$ticketNum'";
          mysqli_query($db, $delete_seats_sql);
        }
      }
    }
    ?>
  </table>
  <br> <br> <br>
  <form method='post'>
  <label for='tailID'>Tail ID:</label><br>
  <select name='tailID'>
    <?php
    // Connect to MySQL database
    include "config.php";

    // Retrieve rows from planes table
    $planes_sql = "SELECT * FROM planes";
    $planes_result = mysqli_query($db, $planes_sql);

    // Generate options for tail ID select element
    while ($row = mysqli_fetch_assoc($planes_result)) {
      $tailID = $row['tailID'];

      // Check if this tail ID is already in the goesTo table
      $in_goesTo_sql = "SELECT * FROM goesTo WHERE tailID = '$tailID'";
      $in_goesTo_result = mysqli_query($db, $in_goesTo_sql);
      if (mysqli_num_rows($in_goesTo_result) == 0) {
        // This tail ID is not in the goesTo table, so it can be used
        echo "<option value='$tailID'>$tailID</option>";
      }
    }
    ?>
  </select><br>
  <label for='portID'>Destination:</label><br>
  <select name='portID'>
  <?php
  // Connect to MySQL database
  include "config.php";

  // Retrieve rows from airports table
  $airports_sql = "SELECT * FROM airports";
  $airports_result = mysqli_query($db, $airports_sql);

  // Generate options for destination select element
  while ($row = mysqli_fetch_assoc($airports_result)) {
    $portID = $row['portID'];
    $portName = $row['portName'];
    echo "<option value='$portID'>$portName</option>";
  }
  ?>
  </select><br>
  <label for='flDate'>Date:</label><br>
  <input type='text' name='flDate'><br>
  <label for='flTime'>Time:</label><br>
  <input type='text' name='flTime'><br>
  <label for='fgate'>Gate:</label><br>
  <input type='text' name='fgate'><br>
  <label for='status'>Status:</label><br>
  <select name='status'>
    <option value='ON TIME'>ON TIME</option>
    <option value='DELAYED'>DELAYED</option>
    <option value='CANCELED'>CANCELED</option>
    <option value='GATE OPEN'>GATE OPEN</option>
    <option value='BOARDING'>BOARDING</option>
  </select><br><br>
  <input type='submit' value='Add Flight'>
  <?php
if (isset($_POST['tailID']) && isset($_POST['portID']) && isset($_POST['flDate']) && isset($_POST['flTime']) && isset($_POST['fgate']) && isset($_POST['status'])) {
  $tailID = $_POST['tailID'];
  $portID = $_POST['portID'];
  $flDate = $_POST['flDate'];
  $flTime = $_POST['flTime'];
  $fgate = $_POST['fgate'];
  $status = $_POST['status'];

  $insert_sql = "INSERT INTO goesTo (tailID, portID, flDate, flTime, fgate, status) VALUES ('$tailID', '$portID', '$flDate', '$flTime', '$fgate', '$status')";
  mysqli_query($db, $insert_sql);
}
?>

</form>
<button onclick="window.open('/arrange_flight.php', '_blank')">Flight arrangement</button>
<button onclick="window.open('/add_passenger.php', '_blank')">Add passenger</button>
</body>
</html>


