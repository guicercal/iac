<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 14/03/14
 * Time: 14:18
 */

class MyTemplate {

    public $template;
    public $aux_template;
    public $filename;
    public $blocos = array();


    public function __construct($file)
    {
        //$file = $this->buildFrameFile($file);

        if (file_exists($file)){
            $this->filename = $file;
            $this->template = file_get_contents($file);
            $this->aux_template = file_get_contents($file);
        }
        else{
            echo "arquivo de template nao encontrado";
        }

    }

    public function set($var, $content)
    {

        $this->aux_template = str_replace("{" . $var . "}", $content, $this->aux_template);
    }

    public function Show($bloco,$echo = true,$reset = false)
    {
        /*
         * Prints out the theme to the page
         * However, before we do that, we need to remove every var
         * within {} that are not set
         */
        $blocos = explode("*=> ",$this->parse());

        foreach($blocos as $block){

            $bloc = explode("\r\n",$block,2);
            if($bloc[0] != "")
                $this->blocos[str_replace(" ",'',$bloc[0])] = $bloc[1];


        }
        $html = $this->removeEmpty($this->blocos[$bloco]);


        if($echo){
            echo $html;
            $this->aux_template = file_get_contents($this->filename);
        }
        else{
            if($reset){
                $this->aux_template = file_get_contents($this->filename);
            }
            return $html;
        }
    }

    private function removeEmpty($html)
    {
        /*
         * This function would remove all empty variables from the template wrapped in {}
         */
        return preg_replace('^{.*}^', "", $html);
    }

    public function parse()
    {
        /*
         * This function grabs a static document and returns the content
        */
        return $this->aux_template;
    }

    public function buildFrameFile($filename){
        global $_SERVER;
        $DOCUMENT_ROOT = $_SERVER['DOCUMENT_ROOT'];
        $filename= $DOCUMENT_ROOT. 'takeatrip/wp-content/plugins/takeatrip/' . $filename;
        $fh = fopen($filename, 'r');//open file and create if does not exist
        fclose($fh);//close file
        return $filename;
    }
} 