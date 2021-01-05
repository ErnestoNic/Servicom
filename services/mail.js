const nodemailer = require("nodemailer"); // implementa libreria express para el envio de mails    


const send = async({ email, subject = "Gracias por Registrarte", message = "Click para continuar con el registro" }) => {
    try {
       
        const transporter = nodemailer.createTransport({ 

            service: process.env.MAIL_SERVICE,
            auth: {
                user: process.env.MAIL_USER, 
                pass: process.env.MAIL_PASSWORD
            },
            tls: { rejectUnauthorized: false }, 
        });
        const info = {
            from: process.env.MAIL_USER,
            to: email,
            subject: subject,
            html: message,
           
        };
        const { messageId } = await transporter.sendMail(info); 
        return messageId;
    } catch (e) {
        console.log(e);
    }

};
module.exports = { send }; 