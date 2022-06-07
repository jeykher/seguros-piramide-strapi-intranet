#!/bin/sh

i=1;
j=0;
k=0;
exists=true;

while ($exists == true);
do
    dockerRes=$(docker manifest inspect registry.gitlab.com/piramide-portal-3601/intranetsegurospiramide:dev-$i.$j.$k)

    if ($dockerRes != *"no such manifest"*) then
        if ($k == 9) then
            if ($j == 9) then
                ((i=i+1))
                j=0;
                k=0;
            else
                ((j=j+1))
                k=0;
            fi
        else 
            ((k=k+1))
            echo $k
        fi;
    else
        exists=false;
    fi;
    echo $i.$j.$k;
done;

echo $i.$j.$k;

exit 0