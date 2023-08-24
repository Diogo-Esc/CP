import sys
import random

number_of_particles = int(sys.argv[1])
max_particle_position = int(sys.argv[2])
max_particle_energy = int(sys.argv[3])

print(number_of_particles)

for i in range (number_of_particles):
  #position = random.randint(1, max_particle_position)
  #energy = random.randint(1, max_particle_energy)
  position = int(random.random()*max_particle_position)
  energy = int(random.random()*max_particle_energy)

  print('%d %d' % (position, energy))
