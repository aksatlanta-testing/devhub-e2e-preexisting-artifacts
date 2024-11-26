
{{- define "go-echod0170adb-55b2-4161-a86d-f9ed19bd365e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0170adb-55b2-4161-a86d-f9ed19bd365e.fullname" -}}
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


{{- define "go-echod0170adb-55b2-4161-a86d-f9ed19bd365e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0170adb-55b2-4161-a86d-f9ed19bd365e.labels" -}}
helm.sh/chart: {{ include "go-echod0170adb-55b2-4161-a86d-f9ed19bd365e.chart" . }}
{{ include "go-echod0170adb-55b2-4161-a86d-f9ed19bd365e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0170adb-55b2-4161-a86d-f9ed19bd365e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0170adb-55b2-4161-a86d-f9ed19bd365e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}