
{{- define "go-echoc7c77768-a01f-435d-b656-23002ce8af56.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7c77768-a01f-435d-b656-23002ce8af56.fullname" -}}
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


{{- define "go-echoc7c77768-a01f-435d-b656-23002ce8af56.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7c77768-a01f-435d-b656-23002ce8af56.labels" -}}
helm.sh/chart: {{ include "go-echoc7c77768-a01f-435d-b656-23002ce8af56.chart" . }}
{{ include "go-echoc7c77768-a01f-435d-b656-23002ce8af56.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc7c77768-a01f-435d-b656-23002ce8af56.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc7c77768-a01f-435d-b656-23002ce8af56.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}