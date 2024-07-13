<?php

class View_Subject_Head
{
    public function show_head_left($info)
    {
        require_once 'config/config.php';
        include 'res/templates/subject_head/head_left.php';
    }
    public function show_foot()
    {
        require_once 'config/config.php';
        include 'res/templates/shared/foot.php';
    }
    public function show_subject_head_panel()
    {
        include 'res/templates/subject_head/subject_head_panel.html';
    }
    public function show_dashboard($dashboard)
    {
        include 'res/templates/subject_head/dashboard.php';
    }
    
    public function show_questions_panel()
    {
        include 'res/templates/subject_head/questions_panel.html';
    }
    public function show_subjects_panel()
    {
        include 'res/templates/subject_head/subjects_panel.html';
    }
    public function show_tests_panel()
    {
        include 'res/templates/subject_head/tests_panel.html';
    }
    public function show_tests_detail($questions)
    {
        include 'res/templates/subject_head/tests_detail.php';
    }
    public function show_test_score($scores)
    {
        include 'res/templates/subject_head/test_score.php';
    }
   
    public function show_units_panel()
    {
        include 'res/templates/subject_head/units_panel.html';
    }
    public function show_about()
    {
        require_once 'config/config.php';
        include 'res/templates/shared/about.php';
    }
    public function show_profiles($profile)
    {
        include 'res/templates/shared/profiles.php';
    }
    public function show_404()
    {
        include 'res/templates/shared/404.html';
    }
}
