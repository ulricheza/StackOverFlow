package isima

import java.awt.image.BufferedImage
import javax.imageio.ImageIO

class UserService {

	def grailsApplication

    def loadDefaultProfileImage() {

        String imagePath = grailsApplication.parentContext.getResource("/images/defaultProfileImage.png/").getFile().toString()
        BufferedImage defaultProfileImage = ImageIO.read(new File(imagePath))
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
        ImageIO.write(defaultProfileImage,"png",baos)
        baos.flush()
        byte[] imageInByte = baos.toByteArray()
        baos.close()
        
        return imageInByte
    }
}