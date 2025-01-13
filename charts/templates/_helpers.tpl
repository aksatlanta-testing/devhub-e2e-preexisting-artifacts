
{{- define "go-echo3a59ee12-5e6d-48ac-a95f-da4db5c6fdc1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a59ee12-5e6d-48ac-a95f-da4db5c6fdc1.fullname" -}}
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


{{- define "go-echo3a59ee12-5e6d-48ac-a95f-da4db5c6fdc1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a59ee12-5e6d-48ac-a95f-da4db5c6fdc1.labels" -}}
helm.sh/chart: {{ include "go-echo3a59ee12-5e6d-48ac-a95f-da4db5c6fdc1.chart" . }}
{{ include "go-echo3a59ee12-5e6d-48ac-a95f-da4db5c6fdc1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3a59ee12-5e6d-48ac-a95f-da4db5c6fdc1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3a59ee12-5e6d-48ac-a95f-da4db5c6fdc1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}