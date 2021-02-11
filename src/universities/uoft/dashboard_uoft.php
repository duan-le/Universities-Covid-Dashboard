<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>University of Toronto</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
  <link rel="shortcut icon" href="../../assets/favicon/favicon-32x32.png" />
	<link rel="shortcut icon" href="../../assets/favicon/favicon-16x16.png" />	
  <link rel="stylesheet" href="../universities_style.css" />
</head>

<body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
      <!-- Brand/Logo -->
      <a class="navbar-brand" href="../../index.html">Covid Overflow</a>

      <!--Collapsible navbar for small screens-->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Navbar links -->
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown">
            <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Universities
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="../mcgill/dashboard_mcgill.php">McGill University</a>
						<a class="dropdown-item" href="../uofc/dashboard_uofc.php">University of Calgary</a>
						<a class="dropdown-item" href="../uofm/dashboard_uofm.php">University of Manitoba</a>
            <a class="dropdown-item" href="./dashboard_uoft.php">University of Toronto</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../../about/about.html">About Us</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Body -->
  <div class="container-fluid padding">
    <div class="welcome text-left">
      <div class="col-0" style="display: flex; align-items: flex-end">
        <img class="img-fluid" style="float: left" src="logo_uoft.png" alt="uoft logo" />
        <h1 class="display-4">
          <strong>University of Toronto</strong>
        </h1>
      </div>
      <hr />
    </div>
  </div>

  <div class="container-fluid padding">
    <div class="whatshappening text-center">
      <h3 class="display-5">
        Here's what's happening in
        <a href="https://www.utoronto.ca/utogether/covid19-dashboard" class="text-primary" target="_blank">University of Toronto</a>
      </h3>
    </div>
    <div class="dashboard text-center">
      <h3 class="display-4">Dashboard</h3>
    </div>
  </div>

  <!-- Covid Graph -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
  <div class="container-fluid padding">
  <div class="chart-container">
  <canvas id="myChart"></canvas>
  <script>
    <?php
    $link = mysqli_connect("localhost", "root", "password", "university_covid");
    if ($link === false) {
      die("ERROR: Could not connect. " . mysqli_connect_error());
    }
    $sql = "SELECT * FROM ontario WHERE university_name = 'University of Toronto' AND cases != 0 ORDER BY STR_TO_DATE(date_range, '%e-%c-%Y') ASC";
    $casesData = array();
    $totalCasesData = array();
    $dateData = array();
    if ($result = mysqli_query($link, $sql)) {
      if (mysqli_num_rows($result) > 0) {
        $i = 0;
        while ($row = mysqli_fetch_array($result)) {
          $date_arr = explode("-", $row['date_range']);
          $date = $date_arr[2] . "-" . ($date_arr[1] < 10 ? "0" . $date_arr[1] : $date_arr[1]) . "-" . ($date_arr[0] < 10 ? "0" . $date_arr[0] : $date_arr[0]);
          $casesData[] = $row['cases'];
          $dateData[] = $date;
          if ($i == 0) {
            $totalCasesData[] = $casesData[$i];
          } else {
            $totalCasesData[] = intval($casesData[$i]) + intval($totalCasesData[$i - 1]);
          }
          $i++;
        }
        echo "let casesData = " . json_encode($casesData) . ";";
        echo "let totalCasesData = " . json_encode($totalCasesData) . ";";
        echo "let dateData = " . json_encode($dateData) . ";";
      }
      mysqli_free_result($result);
    } else {
      echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }
    mysqli_close($link);
    ?>
  var ctx = document.getElementById('myChart').getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'line',
      data: {
          labels: dateData,
          datasets: [{
              label: 'Daily Cases',
              data: casesData,
              borderColor: 'rgba(255, 99, 132, 1)',
              pointBorderColor: 'rgba(255, 99, 132, 1)',
              backgroundColor: 'rgba(255, 99, 132, 0.2)',
              pointBackgroundColor: 'rgba(255, 99, 132, 0.2)',
          },
          {
              label: 'Total Cases',
              data: totalCasesData,
              borderColor: 'rgba(54, 162, 235, 1)',
              pointBorderColor: 'rgba(54, 162, 235, 1)',
              backgroundColor: 'rgba(54, 162, 235, 0.2)',
              pointBackgroundColor: 'rgba(54, 162, 235, 0.2)',
          },
        ]
      },
  });
  </script>
  </div>
  </div>

  <!-- Covid Dashboard -->
  <div class="container-fluid padding">
    <div class="row justify-content-center">
      <div class="col-auto">
        <table class="table table-striped table-bordered" id="data-table">
          <thead>
            <tr>
              <th scope="col">Date (yyyy-mm-dd)/th>
              <th scope="col">Active Cases</th>
            </tr>
          </thead>
          <tbody>
            <?php
            $link = mysqli_connect("localhost", "root", "password", "university_covid");
            if ($link === false) {
              die("ERROR: Could not connect. " . mysqli_connect_error());
            }
            $sql = "SELECT * FROM ontario WHERE university_name = 'University of Toronto' AND cases != 0 ORDER BY STR_TO_DATE(date_range, '%e-%c-%Y') DESC";
            if ($result = mysqli_query($link, $sql)) {
              if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_array($result)) {
                  $date_arr = explode("-", $row['date_range']);
                  $date = $date_arr[2] . "-" . ($date_arr[1] < 10 ? "0" . $date_arr[1] : $date_arr[1]) . "-" . ($date_arr[0] < 10 ? "0" . $date_arr[0] : $date_arr[0]);
                  echo "<tr>";
                  echo "<th scope='row'>" . $date . "</th>";
                  echo "<td>" . $row['cases'] . "</td>";
                  echo "</tr>";
                }
              }
              mysqli_free_result($result);
            } else {
              echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
            }
            mysqli_close($link);
            ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <div class="financial-mental container-fluid text-center">
    <p>
      For financial resources, University of Toronto provides financial aid
      and awards to students each year. Find out more
      <a href="https://future.utoronto.ca/finances/financial-aid/" target="_blank">here.</a>
    </p>

    <p>
      For mental health as well as general health and wellness, University of
      Toronto offers self-help resources, counselling and others. Find out
      more
      <a href="https://mentalhealth.utoronto.ca/" target="_blank">here.</a>
    </p>
  </div>

  <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js></script>
  <script src=https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.20/js/jquery.dataTables.min.js></script>
  <script src=https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.20/js/dataTables.bootstrap4.min.js></script>

  <script>
    $(document).ready(function() {
      $('#data-table').DataTable();
    });
  </script>

  <!--- Footer -->
  <footer class="container-fluid">
    <p>HackTogether 2020</p>
    <p>© Covid Overflow 2020</p>
  </footer>
</body>

</html>