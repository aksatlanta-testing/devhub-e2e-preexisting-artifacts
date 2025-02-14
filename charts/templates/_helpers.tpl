
{{- define "go-echo863e2570-f417-4548-893e-cdda089ec0fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo863e2570-f417-4548-893e-cdda089ec0fd.fullname" -}}
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


{{- define "go-echo863e2570-f417-4548-893e-cdda089ec0fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo863e2570-f417-4548-893e-cdda089ec0fd.labels" -}}
helm.sh/chart: {{ include "go-echo863e2570-f417-4548-893e-cdda089ec0fd.chart" . }}
{{ include "go-echo863e2570-f417-4548-893e-cdda089ec0fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo863e2570-f417-4548-893e-cdda089ec0fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo863e2570-f417-4548-893e-cdda089ec0fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}