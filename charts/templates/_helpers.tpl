
{{- define "go-echo47791b1b-72e0-476b-af6f-da044d3d23fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47791b1b-72e0-476b-af6f-da044d3d23fb.fullname" -}}
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


{{- define "go-echo47791b1b-72e0-476b-af6f-da044d3d23fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47791b1b-72e0-476b-af6f-da044d3d23fb.labels" -}}
helm.sh/chart: {{ include "go-echo47791b1b-72e0-476b-af6f-da044d3d23fb.chart" . }}
{{ include "go-echo47791b1b-72e0-476b-af6f-da044d3d23fb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo47791b1b-72e0-476b-af6f-da044d3d23fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo47791b1b-72e0-476b-af6f-da044d3d23fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}