<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Làm Bài Thi</title>
	<link rel="stylesheet" href="res/css/normalize.css">
	<link rel="stylesheet" href="res/css/style.min.css">
	<link rel="stylesheet" href="res/css/font-awesome.css">
	<link rel="stylesheet" href="res/css/materialize.min.css">
	<script src="res/js/jquery.js"></script>
	<script src="res/js/materialize.min.js"></script>
	<script src="res/js/student_functions.js"></script>
</head>

<body class="body-login overflow scrollbar">
	<div class="navbar-fixed">
		<nav>
			<div class="nav-wrapper nav-green">
				<div class="left pad-left-20">
					<span class="title">Làm bài tập <?=$practice[0]->practice_code?></span>
				</div>
				<span class="brand-logo right cursor" id="timer"></span>
			</div>
		</nav>
		<div id="status" class="status"></div>
	</div>
	<div class="test-content">
		<div class="testing-left">
			<?php
			for ($i = 0; $i < count($practice); $i++) {
				if($practice[$i]->student_answer != "") {
					echo '<a href="#quest-'.($i+1).'" class="menu-link">Câu '.($i+1).' <span class="tick" id="tick-'.($i+1).'">✓</span></a>';
				} else {
					echo '<a href="#quest-'.($i+1).'" class="menu-link">Câu '.($i+1).' <span class="tick" id="tick-'.($i+1).'"></span></a>';
				}
			}
			?>
		</div>
		<div class="testing-right">
			<?php
			for($i = 0; $i < count($practice); $i++) {
				?>
				<div id="quest-<?=($i+1)?>" class="item-quest">
					<div class="quest-title">Câu <?=($i+1)?> :</div>
					<div class="quest-content">
						<span><?=$practice[$i]->question_content?></span>
					</div>
					<div class="quest-answer">
						<p>
							<label>
								<?php
								if (trim($practice[$i]->student_answer) == trim($practice[$i]->answer_a))
								{
									echo '<input name="'.$practice[$i]->question_id.'" data-idquest="'.$practice[$i]->question_id.'" type="radio" data-stt="'.($i+1).'" value="'.trim($practice[$i]->answer_a).'" checked />';
								}
								else
								{
									echo '<input name="'.$practice[$i]->question_id.'" data-idquest="'.$practice[$i]->question_id.'" type="radio" data-stt="'.($i+1).'" value="'.trim($practice[$i]->answer_a).'" />';
								}
								?>
								<span><?=$practice[$i]->answer_a?></span>
							</label>
						</p>
						<p>
							<label>
								<?php
								if (trim($practice[$i]->student_answer) == trim($practice[$i]->answer_b))
								{
									echo '<input name="'.$practice[$i]->question_id.'" data-idquest="'.$practice[$i]->question_id.'" type="radio" data-stt="'.($i+1).'" value="'.trim($practice[$i]->answer_b).'" checked />';
								}
								else
								{
									echo '<input name="'.$practice[$i]->question_id.'" data-idquest="'.$practice[$i]->question_id.'" type="radio" data-stt="'.($i+1).'" value="'.trim($practice[$i]->answer_b).'" />';
								}
								?>
								<span><?=$practice[$i]->answer_b?></span>
							</label>
						</p>
						<p>
							<label>
								<?php
								if (trim($practice[$i]->student_answer) == trim($practice[$i]->answer_c))
								{
									echo '<input name="'.$practice[$i]->question_id.'" data-idquest="'.$practice[$i]->question_id.'" type="radio" data-stt="'.($i+1).'" value="'.trim($practice[$i]->answer_c).'" checked />';
								}
								else
								{
									echo '<input name="'.$practice[$i]->question_id.'" data-idquest="'.$practice[$i]->question_id.'" type="radio" data-stt="'.($i+1).'" value="'.trim($practice[$i]->answer_c).'" />';
								}
								?>
								<span><?=$practice[$i]->answer_c?></span>
							</label>
						</p>
						<p>
							<label>
								<?php
								if (trim($practice[$i]->student_answer) == trim($practice[$i]->answer_d))
								{
									echo '<input name="'.$practice[$i]->question_id.'" data-idquest="'.$practice[$i]->question_id.'" type="radio" data-stt="'.($i+1).'" value="'.trim($practice[$i]->answer_d).'" checked />';
								}
								else
								{
									echo '<input name="'.$practice[$i]->question_id.'" data-idquest="'.$practice[$i]->question_id.'" type="radio" data-stt="'.($i+1).'" value="'.trim($practice[$i]->answer_d).'" />';
								}
								?>
								<span><?=$practice[$i]->answer_d?></span>
							</label>
						</p>
						<div class="suggest-content" style="margin-bottom: 15px;">
							<button class="toggle-suggest btn">Gợi ý</button>
							<div class="suggest-content" style="display: none; color: red"><?= $practice[$i]->suggest ?></div>
							
						</div>
					</div>
				</div>
				<?php
			}
			?>
			<a href="index.php?action=accept_practice" class="btn" onclick="return confirm('Xác nhận nộp bài?')" style="width: 300px;margin-left: 40%;margin-bottom: 20px;">Nộp</a>
		</div>
		<div class="clear"></div>
	</div>
	<script>
		var min = <?=$min?>;
		var sec = <?=$sec?>;
		countdown();
		$('input[type=radio]').on("change", function () {
			var stt = $(this).data("stt");
			var idquest = $(this).data("idquest");
			var value = $(this).val();
			var data = {
				id: idquest,
				answer: value,
				min: min,
				sec: sec
			}
			var url = "index.php?action=update_practice_answer";
			var success = function (result) {
				//console.log(result);
				$('#tick-' + stt).text("✓");
			};
			$.post(url, data, success);
		})
		function countdown() {
			cdID = setInterval(function () {
				if (sec == 0) {
					min--;
					sec = 60;
				}
				sec--;
				if (min < 10) {
					$('#timer').css('color', 'red');
					min_text = '0' + min;
				} else {
					min_text = min;
				}
				if (sec < 10)
					sec_text = '0' + sec;
				else
					sec_text = sec;
				$('#timer').text(min_text + ':' + sec_text);
				if (min < 0) {
					alert('Hết giờ, hệ thống sẽ tự động nộp bài!');
					window.location.replace("index.php?action=accept_practice");
				}
			}, 1000);
		}

		$(window).scroll(function () {
		});
		$('a[href*="#"]:not([href="#"])').click(function () {
			if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
				var target = $(this.hash);
				target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
				if (target.length) {
					$('html, body').animate({
						scrollTop: target.offset().top - 65
					}, 500);
					return false;
				}
			}
		});
		window.onbeforeunload = function () {
			var url = "index.php?action=update_practice_timing"
			var data = {
				min: min,
				sec: sec
			}
			var success = function () {};
			$.post(url, data, success);
		}

		$(".toggle-suggest").click(function() {
			$(this).next(".suggest-content").show();
			$(this).hide();		
		})
	</script>
</body>

</html>
