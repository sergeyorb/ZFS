# Домашнее задание - ZFS
<ol>
  <li>Создать виртуальную машину</li>
  <li>Создать пул из двух дисков в режиме RAID 1</li>
  <li>Добавить разные алгоритмы сжатия в каждую файловую систему</li>
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
 </ul>

