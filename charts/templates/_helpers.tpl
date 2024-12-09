
{{- define "go-echofd269be8-9799-4851-b95e-dcd7127d731f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd269be8-9799-4851-b95e-dcd7127d731f.fullname" -}}
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


{{- define "go-echofd269be8-9799-4851-b95e-dcd7127d731f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd269be8-9799-4851-b95e-dcd7127d731f.labels" -}}
helm.sh/chart: {{ include "go-echofd269be8-9799-4851-b95e-dcd7127d731f.chart" . }}
{{ include "go-echofd269be8-9799-4851-b95e-dcd7127d731f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd269be8-9799-4851-b95e-dcd7127d731f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd269be8-9799-4851-b95e-dcd7127d731f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}