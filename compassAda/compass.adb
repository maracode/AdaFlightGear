with imu; use imu;
with Interfaces.C; use Interfaces.C;
package body compass is

	magRaw: array(1 .. 3) of Interfaces.C.int;
procedure start is
begin
	imu.detectIMU;
	imu.enableIMU;

	imu.readMAG(magRaw(1));
		--readMAG(magRaw);
		--printf("magRaw X %i    \tmagRaw Y %i \tMagRaw Z %i \n", magRaw[0],magRaw[1],magRaw[2]);

		--//Compute heading
		--float heading = 180 * atan2(magRaw[1],magRaw[0])/M_PI;

		--//Convert heading to 0 - 360
		--if(heading < 0)
--			heading += 360;

--		printf("heading %7.3f \t ", heading);

--		//Sleep for 0.25ms
--		usleep(25000);

end start;
begin
   magRaw(1) := 0;
   magRaw(2) := 0;
   magRaw(3) := 0;
end compass;
