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
      echo "<td>$status</td>";
      echo "<td></td>";
      echo "</tr>";
    }
    ?>
  </table>
</body>
</html>

