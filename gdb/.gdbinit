directory ~/os161/src/kern/compile/DUMBVM
target remote unix:.sockets/gdb
layout src

# gdb scripts for dumping resizeable arrays.
#
# Unfortunately, there does not seem to be a way to do this without
# cutting and pasting for every type.

define plainarray
    set $n = $arg0.num
    set $i = 0
    printf "%u items\n", $n
    while ($i < $n)
	print $arg0.v[$i]
	set $i++
    end
end
document plainarray
Print a plain (untyped) resizeable array.
Usage: plainarray myarray
end

define array
    set $n = $arg0.arr.num
    set $i = 0
    printf "%u items\n", $n
    while ($i < $n)
	print $arg0.arr.v[$i]
	set $i++
    end
end
document array
Print the pointers in a typed resizeable array.
(Use plainarray for an untyped resizeable array.)
Usage: array allcpus
end

define cpuarray
    set $n = $arg0.arr.num
    set $i = 0
    printf "%u cpus\n", $n
    while ($i < $n)
	printf "cpu %u:\n", $i
	print *(struct cpu *)($arg0.arr.v[$i])
	set $i++
    end
end
document cpuarray
Print an array of struct cpu.
Usage: cpuarray allcpus
end

define threadarray
    set $n = $arg0.arr.num
    set $i = 0
    printf "%u threads\n", $n
    while ($i < $n)
	printf "thread %u:\n", $i
	print *(struct thread *)($arg0.arr.v[$i])
	set $i++
    end
end
document threadarray
Print an array of struct thread.
Usage: threadarray curproc->p_threads
end

define vnodearray
    set $n = $arg0.arr.num
    set $i = 0
    printf "%u vnodes\n", $n
    while ($i < $n)
	printf "vnode %u:\n", $i
	print *(struct vnode *)($arg0.arr.v[$i])
	set $i++
    end
end
document vnodearray
Print an array of struct vnode.
Usage: vnodearray sfs->sfs_vnodes
end

# gdb scripts for manipulating wchans

define allwchans
    set $n = allwchans.arr.num
    set $i = 0
    while ($i < $n)
	set $p = (struct wchan *)(allwchans.arr.v[$i])
	set $pnm = $p->wc_name
	set $pth = &$p->wc_threads
	set $pct = $pth->tl_count
	printf "wchan %u @0x%x: %-16s %u\n", $i, $p, $pnm, $pct
	set $i++
    end
end
document allwchans
Dump the allwchans table.
Usage: allwchans
end

define wchan
    set $p = (struct wchan *)(allwchans.arr.v[$arg0])
    set $pnm = $p->wc_name
    set $pth = $p->wc_threads
    set $pct = $pth.tl_count
    printf "wchan %u @0x%x: %-16s %u:\n", $arg0, $p, $pnm, $pct
    threadlist $pth
end
document wchan
Dump a particular wchan.
Usage: wchan N
(where N is the index into allwchans[] reported by allwchans)
end

define threadlist
    set $t = $arg0.tl_head.tln_next->tln_self
    while ($t != 0)
	printf "thread %s @0x%x\n", $t->t_name, $t
	set $t = $t->t_listnode.tln_next->tln_self
    end
end
document threadlist
Dump a threadlist.
Usage: threadlist mycpu->c_runqueue
end

define allcpus
    set $n = allcpus.arr.num
    set $i = 0
    while ($i < $n)
	set $c = (struct cpu *)(allcpus.arr.v[$i])
	set $id = $c->c_isidle
	set $ln = $c->c_spinlocks
	set $t = $c->c_curthread
	set $zom = $c->c_zombies.tl_count
	set $rn = $c->c_runqueue.tl_count
	printf "cpu %u @0x%x: ", $i, $c
	if ($id)
	    printf "idle, "
	else
	    printf "running, "
	end
	printf "%u spinlocks, ", $ln
	if ($t)
	    printf "current: %s @0x%x\n", $t->t_name, $t
	else
	    printf "no current thread (?)\n"
	end
	if ($zom > 0)
	    printf "%u zombies:\n", $zom
	    threadlist $c->c_zombies
	end
	if ($rn > 0)
	    printf "%u threads in run queue:\n", $rn
	    threadlist $c->c_zombies
	else
	    printf "run queue empty\n"
	end
	printf "\n"
	set $i++
    end
end
document allcpus
Dump all cpus.
Usage: allcpus
end
