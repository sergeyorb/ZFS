# Домашнее задание - ZFS
<ol>
  <li>Создать виртуальную машину</li>
  <li>Создать пул из двух дисков в режиме RAID 1</li>
  <li>Настраиваем пул</li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
</ol>


# 1.Создал виртуальную машину
<ul>
Для создания VM использовал Vagrantfile https://github.com/sergeyorb/ZFS/blob/main/Vagrantfile
  Была создана VM с 8 дисками и установленным ZFS
  Для выполнения постконфигурации VM использовал скрипт https://github.com/sergeyorb/ZFS/blob/main/setup_zfs.sh
</ul>

# 2.Создал пул из дисков в режиме RAID 1
<ul>
<li>После создания VM проверил список дисков командой lsblk</li> 
<li>Создаk пул из дисков в режиме RAID 1 коммандой</li> 
 zpool create otus1 mirror/dev/sdb /dev/sdc 
 zpool create otus2 mirror /dev/sdd /dev/sde
 zpool create otus3 mirror /dev/sdf /dev/sdg
 zpool create otus4 mirror /dev/sdh /dev/sdi 
 <li>Проверbk информацию о пулах командой zpool list</li>
 <li>Добавил разные алгоритмы сжатия в каждую файловую систему командами</li>
 <p>Алгоритм lzjb: zfs set compression=lzjb otus1
 <p>Алгоритм lz4: zfs set compression=lz4 otus2
 <p>Алгоритм gzip: zfs set compression=gzip-9 otus3
 <p>Алгоритм zle: zfs set compression=zle otus4
 <li>Проверил, что все файловые системы имеют разные методы сжатия</li>
 <p>zfs get all | grep compression
 <li>Скачал один и тотже файл во все пулы командой</li>
 <p> do wget -P /otus$i https://gutenberg.org/cache/epub/2600/pg2600.converter.log; done
 <li>Проверил скачивание командой</li>
 <p>ls -l /otus*
 <li>Проверил сколько места занимает сжатый файл</li>
 <p>zfs list
 <p>По выводу видно, что оптимальный алгоритм сжатия в пуле otus3 gzip-9  
 </ul>
 
 # 3.Настраиваем пул

