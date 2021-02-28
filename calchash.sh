#!/bin/bash
echo '#############################'
echo '  Разработал Качалов Кирилл'
echo "Сейчас вы находитесь в ${PWD}"
echo '#############################'
echo ''

finish="Y"

while [ ${finish} != "n" ]
do
	filepath=""
	echo 'Напишите путь до файла, чью контрольную сумму необходимо высчитать:'
	read filepath

	while [ ! -f "$filepath" ]
	do
		echo "Такого файла не существует, попробуйте еще раз:"
		read filepath
	done

	hash=($(md5sum ${filepath}))

	echo "Контрольная сумма файла равна ${hash}"
	echo "Укажите путь до файла, в который будут записаны результаты:"
	read filepath

	answer="n"

	while [ -f "$filepath" ] && [ ${answer} == n ]
	do
	        echo "Такой файл уже существует, Вы действительно хотите его переписать? (Y/n)"
		read answer

		while [ ${answer} != "n" ] && [ ${answer} != "Y" ]
		do
			echo "Пожалуйста, введите Y или n:"
			read answer
		done

		if [ ${answer} == "n" ]; then
			echo "${answer} 2Укажите путь до файла, в который будут записаны результаты:"
			read filepath
		fi
	done

	while ! touch ${filepath};
	do
	        echo "Неправильный путь до файла, попробуйте еще раз:"
	        read filepath
	done

	echo ${hash} > ${filepath}
	echo "Контрольная сумма успешно сохранена"

        echo "Хотите, посчитать еще один файл? (Y/n)"
        read finish

        while [ ${finish} != "n" ] && [ ${finish} != "Y" ]
        do
        	echo "Пожалуйста, введите Y или n:"
                read finish
        done

done
