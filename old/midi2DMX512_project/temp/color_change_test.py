
    color_change_length = limiter.Limiter(min=0.007874015748031496, max=10)

    # def colorChange(self):
    #     self.hsv.preHue = self.hsv.Hue
    #     self.radnomizeColor()
    #
    #     if self.hsv.preHue < self.hsv.Hue:  # +
    #         S_Hue = self.hsv.Hue - self.hsv.preHue
    #         V_Hue = S_Hue / self.color_change_length
    #         t_Hue = S_Hue / V_Hue
    #         start_time = time.time()
    #         end_time = start_time + t_Hue
    #
    #         fullHue = self.hsv.Hue
    #         while time.time() < end_time:
    #             t_reamained = end_time - time.time()
    #             t_elapsed = time.time() - start_time
    #             # print('t_elapsed', t_elapsed)
    #             delta = t_elapsed * V_Hue
    #             print(delta)
    #             self.hsv.Hue = self.hsv.preHue + delta
    #             self.switchColor()
    #             # print(self.hsv.Hue)
    #         self.hsv.Hue = fullHue
    #
    #     elif self.hsv.preHue > self.hsv.Hue:  # -
    #         S_Hue = self.hsv.preHue - self.hsv.Hue
    #         V_Hue = S_Hue / self.color_change_length
    #         t_Hue = S_Hue / V_Hue
    #         start_time = time.time()
    #         end_time = start_time + t_Hue
    #
    #         fullHue = self.hsv.Hue
    #         while time.time() < end_time:
    #             t_elapsed = time.time() - start_time
    #             # print('t_elapsed', t_elapsed)
    #             delta = t_elapsed * V_Hue
    #             print(delta)
    #             self.hsv.Hue = self.hsv.preHue - delta
    #             self.switchColor()
    #             # print(self.hsv.Hue)
    #         self.hsv.Hue = fullHue
    #
    #     _thread.exit()
