<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<style>
  .navbar .btn {
    padding: 0.375rem 0.75rem;
    margin-left: 0.5rem;
    white-space: nowrap;
  }
  .btn-outline-success {
    color: #28a745;
    border-color: #28a745;
  }
  .btn-outline-success:hover {
    background-color: #28a745;
    color: white;
  }
  .btn-info {
    background-color: #007bff;
    border-color: #007bff;
    color: white;
  }
  .btn-info:hover {
    background-color: #0056b3;
    border-color: #0056b3;
  }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">여기에 CI</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">공지사항</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            예약하기
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">도시별 예약</a></li>
            <li><a class="dropdown-item" href="#">날짜별 예약</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">문의사항</a>
        </li>
      </ul>
      <form class="d-flex align-items-center">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
        <button type="button" class="btn btn-info">로그인</button>
      </form>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>