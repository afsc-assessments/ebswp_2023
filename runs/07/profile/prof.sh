#!/opt/homebrew/bin/zsh
#for i in {5851..13369..537}
#for i in {50000..110000..5000}
for i in {50000..130000..2500}
do
				((j++))
        echo "Number: $i"
        ./pm -ycin  $i -print 400 >NUL
				cp pm.bar pm_$j.par
				cp pm.bar pm_$j.bar
				cp pm.rep pm_$j.rep
done
