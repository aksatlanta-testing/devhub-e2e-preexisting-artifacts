
{{- define "go-echo0ea3657b-97e8-4b1a-a75b-44d92771a219.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0ea3657b-97e8-4b1a-a75b-44d92771a219.fullname" -}}
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


{{- define "go-echo0ea3657b-97e8-4b1a-a75b-44d92771a219.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0ea3657b-97e8-4b1a-a75b-44d92771a219.labels" -}}
helm.sh/chart: {{ include "go-echo0ea3657b-97e8-4b1a-a75b-44d92771a219.chart" . }}
{{ include "go-echo0ea3657b-97e8-4b1a-a75b-44d92771a219.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0ea3657b-97e8-4b1a-a75b-44d92771a219.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0ea3657b-97e8-4b1a-a75b-44d92771a219.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}