
{{- define "go-echo50809915-405e-4d4c-9535-8af72adb679b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo50809915-405e-4d4c-9535-8af72adb679b.fullname" -}}
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


{{- define "go-echo50809915-405e-4d4c-9535-8af72adb679b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo50809915-405e-4d4c-9535-8af72adb679b.labels" -}}
helm.sh/chart: {{ include "go-echo50809915-405e-4d4c-9535-8af72adb679b.chart" . }}
{{ include "go-echo50809915-405e-4d4c-9535-8af72adb679b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo50809915-405e-4d4c-9535-8af72adb679b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo50809915-405e-4d4c-9535-8af72adb679b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}