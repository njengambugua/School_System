<?php
include("teacher_DBO.php");

class Teacher
{
    public $name;
    public $staff_no;
    public $password;
    public $teacherObj;
    public $error;
    public $obj;
    public $lastInsertId;
    public $numRows;
    public $data;


    function __construct()
    {
        $this->teacherObj = new teacherDBO;
        $this->error = $this->teacherObj->error;
    }

    function setObj($obj)
    {
        $this->obj = new stdClass;
        $this->obj->regno = $obj->regno;
        $this->obj->password = $obj->password;
    }

    function getObj()
    {
        return $this->obj;
    }

    function create($obj)
    {
        $this->setObj($obj);
        $this->getObj();

        if ($this->teacherObj->insert($obj)) {
            $this->lastInsertId = $this->teacherObj->lastInsertId;
            return true;
        } else {
            $this->error = $this->teacherObj->error;
            return false;
        }
    }



    public function retrieve($obj)
    {
        $this->setObj($obj);
        $this->getObj();
        if ($this->teacherObj->select($obj)) {
            $this->numRows = $this->teacherObj->numRows;
            $this->data = $this->teacherObj->res;
            return true;
        } else {
            $this->error = $this->teacherObj->error;
            return false;
        }
    }
}
