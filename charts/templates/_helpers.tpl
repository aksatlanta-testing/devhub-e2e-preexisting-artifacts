
{{- define "go-echo2b5335f2-7708-4598-a08e-891f05ff137a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b5335f2-7708-4598-a08e-891f05ff137a.fullname" -}}
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


{{- define "go-echo2b5335f2-7708-4598-a08e-891f05ff137a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b5335f2-7708-4598-a08e-891f05ff137a.labels" -}}
helm.sh/chart: {{ include "go-echo2b5335f2-7708-4598-a08e-891f05ff137a.chart" . }}
{{ include "go-echo2b5335f2-7708-4598-a08e-891f05ff137a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2b5335f2-7708-4598-a08e-891f05ff137a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2b5335f2-7708-4598-a08e-891f05ff137a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}