
{{- define "go-echoaf0e49d7-c76f-461e-abb1-b5b2b369842a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf0e49d7-c76f-461e-abb1-b5b2b369842a.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoaf0e49d7-c76f-461e-abb1-b5b2b369842a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf0e49d7-c76f-461e-abb1-b5b2b369842a.labels" -}}
helm.sh/chart: {{ include "go-echoaf0e49d7-c76f-461e-abb1-b5b2b369842a.chart" . }}
{{ include "go-echoaf0e49d7-c76f-461e-abb1-b5b2b369842a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf0e49d7-c76f-461e-abb1-b5b2b369842a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf0e49d7-c76f-461e-abb1-b5b2b369842a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}