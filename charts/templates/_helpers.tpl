
{{- define "go-echoc078a604-0a39-4688-a6ad-a621e544a452.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc078a604-0a39-4688-a6ad-a621e544a452.fullname" -}}
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


{{- define "go-echoc078a604-0a39-4688-a6ad-a621e544a452.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc078a604-0a39-4688-a6ad-a621e544a452.labels" -}}
helm.sh/chart: {{ include "go-echoc078a604-0a39-4688-a6ad-a621e544a452.chart" . }}
{{ include "go-echoc078a604-0a39-4688-a6ad-a621e544a452.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc078a604-0a39-4688-a6ad-a621e544a452.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc078a604-0a39-4688-a6ad-a621e544a452.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}