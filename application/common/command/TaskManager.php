<?php


namespace app\common\command;

use EasyTask\Task;
use think\console\Command;
use think\console\Input;
use think\console\input\Argument;
use think\console\Output;

class TaskManager extends Command
{
    protected function configure()
    {
        //设置名称为task
        $this->setName('task')
            //增加一个命令参数
            ->addArgument('action', Argument::OPTIONAL, "action")
            ->addArgument('force', Argument::OPTIONAL, "force");
    }

    protected function execute(Input $input, Output  $output)
    {
        //获取输入参数
        $action = trim($input->getArgument('action'));
        $force = trim($input->getArgument('force'));

        // 配置任务
        $task = new Task();
        $task->setRunTimePath('./runtime/');
        $task->addFunc(function () {
            $url = 'https://www.gaojiufeng.cn/?id=319';
            file_get_contents($url);
        }, 'request', 10, 2);;

        // 根据命令执行
        if ($action == 'start')
        {
            $task->start();
        }
        elseif ($action == 'status')
        {
            $task->status();
        }
        elseif ($action == 'stop')
        {
            $force = ($force == 'force'); //是否强制停止
            $task->stop($force);
        }
        else
        {
            exit('Command is not exist');
        }
    }
}