class Person
  def initialize(hanging_parts: 0)
    @hanging_parts = hanging_parts
  end

  def hang
    self.hanging_parts += 1
  end

  def display
    <<~UI
         _________
         |       |
         #{head}       |
        #{left_arm}#{torso}#{right_arm}      |
        #{left_leg} #{right_leg}      |
                 |
      ___________|
    UI
  end

  def dead?
    hanging_parts >= 6
  end

  private

  def hanging_parts
    @hanging_parts
  end

  def hanging_parts=(new_value)
    @hanging_parts = new_value
  end

  def head
    get_part(hangs_at: 1, part_text: "O")
  end

  def torso
    get_part(hangs_at: 2, part_text: "|")
  end

  def left_arm
    get_part(hangs_at: 3, part_text: "/")
  end

  def right_arm
    get_part(hangs_at: 4, part_text: "\\")
  end

  def left_leg
    get_part(hangs_at: 5, part_text: "/")
  end

  def right_leg
    get_part(hangs_at: 6, part_text: "\\")
  end

  def get_part(hangs_at:, part_text:)
    hanging_parts >= hangs_at ? part_text : " "
  end
end
