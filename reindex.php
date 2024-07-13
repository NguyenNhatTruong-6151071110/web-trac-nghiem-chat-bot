<?php
    $sql="select *from tests limit 6";
    $connect = mysqli_connect('localhost','root','','tno_test');
    $query= mysqli_query($connect, $sql);
    $teacher="select *from teachers limit 6";
    $query2= mysqli_query($connect, $teacher);
    $student = "SELECT students.name, classes.class_name, AVG(scores.score_number) as score
    from students, scores, classes where students.student_id = scores.student_id 
    AND classes.class_id = students.class_id
	GROUP BY students.name 
    ORDER BY AVG(scores.score_number) DESC LIMIT 4";
    $query_student = mysqli_query($connect, $student);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Hệ thống thi trực tuyến</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500&family=Roboto:wght@500;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <div class="container-fluid bg-primary text-white d-none d-lg-flex">
        <div class="container py-3">
            <div class="d-flex align-items-center">
                <a href="index.html">
                    <h2 class="text-white fw-bold m-0">PracUNI</h2>
                </a>
                <div class="ms-auto d-flex align-items-center">
                    <small class="ms-4"><i class="fa fa-map-marker-alt me-3"></i>218 Lĩnh Nam, Hoàng Mai, Hà Nội</small>
                    <small class="ms-4"><i class="fa fa-envelope me-3"></i>uneti@email.com</small>
                    <small class="ms-4"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</small>
                    <div class="ms-3 d-flex">
                        <a class="btn btn-sm-square btn-light text-primary rounded-circle ms-2" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-sm-square btn-light text-primary rounded-circle ms-2" href=""><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-sm-square btn-light text-primary rounded-circle ms-2" href=""><i
                                class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid bg-white sticky-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg bg-white navbar-light p-lg-0">
                <a href="index.php" class="navbar-brand d-lg-none">
                    <h1 class="fw-bold m-0">PracUNI</h1>
                </a>
                <button type="button" class="navbar-toggler me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav">
                        <a href="index.php" class="nav-item nav-link active">Trang chủ</a>
                        <a href="service.html" class="nav-item nav-link">Thao tác</a>
                        <a href="project.html" class="nav-item nav-link">Dự án</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Khối</a>
                            <div class="dropdown-menu bg-light rounded-0 rounded-bottom m-0">
                                <a href="feature.html" class="dropdown-item">Khối 10</a>
                                <a href="team.html" class="dropdown-item">Khối 11</a>
                                <a href="testimonial.html" class="dropdown-item">Khối 12</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Liên hệ</a>
                    </div>
                    <div class="ms-auto d-none d-lg-block">
                        <a href="index.php" class="btn btn-primary rounded-pill py-2 px-3">Login</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Carousel Start -->
    <div class="container-fluid px-0 mb-5">
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/carousel-1.jpg" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-lg-7 text-start">
                                    <p class="fs-4 text-white animated slideInRight">Welcome to
                                        <strong>PracUNI</strong>
                                    </p>
                                    <h1 class="display-1 text-white mb-4 animated slideInRight">PracUNI - To Fulfill Dreams</h1>
                                    <a href=""
                                        class="btn btn-primary rounded-pill py-3 px-5 animated slideInRight">Explore
                                        More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/carousel-2.jpg" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-end">
                                <div class="col-lg-7 text-end">
                                    <p class="fs-4 text-white animated slideInLeft">Welcome to <strong>PracUNI</strong>
                                    </p>
                                    <h1 class="display-1 text-white mb-5 animated slideInLeft">Ôn luyện và thi thử trực tuyến</h1>
                                    <a href=""
                                        class="btn btn-primary rounded-pill py-3 px-5 animated slideInLeft">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Trước</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Sau</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- Features Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0 feature-row">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <div class="feature-item border h-100 p-5">
                        <div class="btn-square bg-light rounded-circle mb-4" style="width: 64px; height: 64px;">
                            <img class="img-fluid" src="img/icon/icon-1.png" alt="Icon">
                        </div>
                        <h5 class="mb-3">Sáng tạo</h5>
                        <p class="mb-0">PracUNI luôn luôn tiếp thu và sáng tạo không ngừng.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.3s">
                    <div class="feature-item border h-100 p-5">
                        <div class="btn-square bg-light rounded-circle mb-4" style="width: 64px; height: 64px;">
                            <img class="img-fluid" src="img/icon/icon-2.png" alt="Icon">
                        </div>
                        <h5 class="mb-3">Giáo viên chuyên nghiệp</h5>
                        <p class="mb-0">Được học tập và trao đổi với giáo viên có chuyên môn cao.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.5s">
                    <div class="feature-item border h-100 p-5">
                        <div class="btn-square bg-light rounded-circle mb-4" style="width: 64px; height: 64px;">
                            <img class="img-fluid" src="img/icon/icon-3.png" alt="Icon">
                        </div>
                        <h5 class="mb-3">Thi thử miễn phí</h5>
                        <p class="mb-0">Được ôn luyện và thi thử miễn phí với bộ đề từ giảng viên trong trường,</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.7s">
                    <div class="feature-item border h-100 p-5">
                        <div class="btn-square bg-light rounded-circle mb-4" style="width: 64px; height: 64px;">
                            <img class="img-fluid" src="img/icon/icon-4.png" alt="Icon">
                        </div>
                        <h5 class="mb-3">Hỗ trợ 24/7</h5>
                        <p class="mb-0">PracUNI có đội ngũ nhân viên chuyên nghiệp hỗ trợ 24/7.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Features End -->


    <!-- About Start -->
    <div class="container-xxl about my-5">
        <div class="container">
            <div class="row g-0">
                <div class="col-lg-6">
                    <div class="h-100 d-flex align-items-center justify-content-center" style="min-height: 300px;">
                        <button type="button" class="btn-play" data-bs-toggle="modal"
                            data-src="https://www.youtube.com/embed/DWRcNpR6Kdc" data-bs-target="#videoModal">
                            <span></span>
                        </button>
                    </div>
                </div>
                <div class="col-lg-6 pt-lg-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="bg-white rounded-top p-5 mt-lg-5">
                        <p class="fs-5 fw-medium text-primary">Về chúng tôi</p>
                        <h1 class="display-6 mb-4">PracUNI - Website thi trắc nghiệm trực tuyến</h1>
                        <p class="mb-4">Hệ thống giúp giáo viên giải quyết vấn đề sinh đề thi trắc nghiệm và giúp sinh viên ôn luyện và thi trắc nghiệm miễn phí</p>
                        <div class="row g-5 pt-2 mb-5">
                            <div class="col-sm-6">
                                <img class="img-fluid mb-4" src="img/icon/icon-5.png" alt="">
                                <h5 class="mb-3">Sinh đề thi</h5>
                                <span>Giúp giáo viên sinh đề thi trắc nghiệm trực tuyến chỉ bằng vài thao tác đơn giản</span>
                            </div>
                            <div class="col-sm-6">
                                <img class="img-fluid mb-4" src="img/icon/icon-2.png" alt="">
                                <h5 class="mb-3">Thi trực tuyến</h5>
                                <span>Giúp sinh viên thi thử và ôn luyện miễn phí</span>
                            </div>
                        </div>
                        <a class="btn btn-primary rounded-pill py-3 px-5" href="">Trải nghiệm thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Video Modal Start -->
    <div class="modal modal-video fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content rounded-0">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel">Youtube Video</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 16:9 aspect ratio -->
                    <div class="ratio ratio-16x9">
                        <iframe class="embed-responsive-item" src="" id="video" allowfullscreen
                            allowscriptaccess="always" allow="autoplay"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Video Modal End -->


    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-medium text-primary">Nổi bật</p>
                <h1 class="display-5 mb-5">Đề thi thử</h1>
            </div>
            <div class="row g-4">
            <?php
                while ($row= mysqli_fetch_array($query)) {
            ?>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item position-relative h-100">
                        <div class="service-text rounded p-5">
                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                style="width: 100%; height: 100%;">
                                <img class="img-fluid" src="img/icon/test.jpg" alt="Icon">
                            </div>
                            <h5 class="mb-3"><?php echo $row['test_name']; ?></h4>
                                <p class="mb-0">Thời gian làm bài: <?php echo $row['time_to_do']; ?></p>
                                <p class="mb-0">Tổng số câu: <?php echo $row['total_questions']; ?></p>
                        </div>
                        <div class="service-btn rounded-0 rounded-bottom">
                            <a class="text-primary fw-medium" href="index.php"><i class="bi bi-chevron-double-left ms-2"></i> Bài Thi || </a>
                            <a class="text-primary fw-medium" href="index.php">  Ôn luyện<i class="bi bi-chevron-double-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
            <?php
                }
            ?>
            </div>
        </div>
    </div>
    <!-- Service End -->


    <!-- Project Start -->
    <div class="container-xxl pt-5">
        <div class="container">
            <div class="text-center text-md-start pb-5 pb-md-0 wow fadeInUp" data-wow-delay="0.1s"
                style="max-width: 500px;">
                <p class="fs-5 fw-medium text-primary">Các giáo viên ưu tú trong trường với nhiều năm kinh nghiệm</p>
                <h1 class="display-5 mb-5">Giáo viên ưu tú</h1>
            </div>
            <div class="owl-carousel project-carousel wow fadeInUp" data-wow-delay="0.1s">
                <?php
                    while ($row2= mysqli_fetch_array($query2)) {
                ?>
                        <div class="project-item mb-5">
                    <div class="position-relative">
                        <img class="img-fluid" src="img/project-2.jpg" alt="">
                        <div class="project-overlay">
                            <a class="btn btn-lg-square btn-light rounded-circle m-1" href="img/project-2.jpg"
                                data-lightbox="project"><i class="fa fa-eye"></i></a>
                            <a class="btn btn-lg-square btn-light rounded-circle m-1" href=""><i
                                    class="fa fa-link"></i></a>
                        </div>
                    </div>
                    <div class="p-4">
                        <a class="d-block h5" href=""><?=  $row2['name'];?></a>
                        <span>Giáo viên dạy giỏi cấp tỉnh</span>
                    </div>
                    </div>
                <?php
                    }
                ?>
               
            </div>
        </div>
    </div>
    <!-- Project End -->


    <!-- Quote Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <p class="fs-5 fw-medium text-primary">Bạn cần gì</p>
                    <h1 class="display-5 mb-4">Bạn cần trợ giúp từ chúng tôi? Có chúng tôi ở đây!</h1>
                    <p>Nhân viên hỗ trợ 24/7 sẵn sàng trả lời mọi thắc mắc. Nếu bạn cần trợ giúp hãy gửi lại địa chỉ email tại đây để chúng tôi có thể giúp đỡ bạn nhé!</p>
                    <a class="d-inline-flex align-items-center rounded overflow-hidden border border-primary" href="">
                        <span class="btn-lg-square bg-primary" style="width: 55px; height: 55px;">
                            <i class="fa fa-phone-alt text-white"></i>
                        </span>
                        <span class="fs-5 fw-medium mx-4">+012 345 6789</span>
                    </a>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <h2 class="mb-4">Gửi phản hồi</h2>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="name" placeholder="Tên">
                                <label for="name">Tên của bạn</label>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-floating">
                                <input type="email" class="form-control" id="mail" placeholder="Email">
                                <label for="mail">Email</label>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="mobile" placeholder="SĐT">
                                <label for="mobile">Số điện thoại</label>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-floating">
                                <select class="form-select" id="service">
                                    <option selected>Đăng kí tài khoản</option>
                                    <option value="">Thi thử miễn phí</option>
                                    <option value="">Ôn luyện trực tuyến</option>
                                    <option value="">Sinh đề thi</option>
                                </select>
                                <label for="service">Hãy chọn một dịch vụ</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Để lại lời nhắn tại đây" id="message"
                                    style="height: 130px"></textarea>
                                <label for="message">Lời nhắn</label>
                            </div>
                        </div>
                        <div class="col-12 text-center">
                            <button class="btn btn-primary w-100 py-3" type="submit">Gửi</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Quote Start -->


    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-medium text-primary">Học sinh xuất sắc</p>
                <h1 class="display-5 mb-5">Đạt thành tích tốt trong các kì thi</h1>
            </div>
            <div class="row g-4">
            <?php
                while ($row_student= mysqli_fetch_array($query_student)) {
            ?>

                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item rounded overflow-hidden pb-4">
                        <img class="img-fluid mb-4" src="img/team-1.jpg" alt="">
                        <h5><?=  $row_student['name']?></h5>
                        <span class="text-primary"><?=  $row_student['class_name']?></span>
                        <ul class="team-social">
                            <li><a class="btn btn-square" href=""><i class="fab fa-facebook-f"></i></a></li>
                            <li><a class="btn btn-square" href=""><i class="fab fa-twitter"></i></a></li>
                            <li><a class="btn btn-square" href=""><i class="fab fa-instagram"></i></a></li>
                            <li><a class="btn btn-square" href=""><i class="fab fa-linkedin-in"></i></a></li>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-dark footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-4 col-md-6">
                    <h4 class="text-white mb-4">PRACUNI</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>218 Lĩnh Nam, Hoàng Mai, Hà Nội
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>pracuni@edu.vn</p>
                    <div class="d-flex pt-3">
                        <a class="btn btn-square btn-light rounded-circle me-2" href=""><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-light rounded-circle me-2" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-light rounded-circle me-2" href=""><i
                                class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-light rounded-circle me-2" href=""><i
                                class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <h4 class="text-white mb-4">Links</h4>
                    <a class="btn btn-link" href="">Về chúng tôi</a>
                    <a class="btn btn-link" href="">Liên hệ</a>
                    <a class="btn btn-link" href="">Dịch vụ</a>
                    <a class="btn btn-link" href="">Hỗ trợ</a>
                </div>
                <div class="col-lg-4 col-md-6">
                    <h4 class="text-white mb-4">Góp ý</h4>
                    <p>Mọi thông tin liên hệ hãy gửi về hòm thư của chúng tôi</p>
                    <div class="position-relative w-100">
                        <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text"
                            placeholder="Your email">
                        <button type="button"
                            class="btn btn-light py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Copyright Start -->
    <div class="container-fluid copyright py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center mb-3 mb-md-0">
                    &copy; <a class="fw-medium text-light" href="#">Copyright</a> NguyenThuy
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
            class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>